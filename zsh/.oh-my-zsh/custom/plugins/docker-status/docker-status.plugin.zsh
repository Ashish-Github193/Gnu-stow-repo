#!/usr/bin/env zsh
# Docker Status Plugin for Oh My Zsh
# Displays comprehensive Docker system status on shell login

# Configuration variables (can be overridden in .zshrc)
DOCKER_STATUS_ENABLED=${DOCKER_STATUS_ENABLED:-true}
DOCKER_STATUS_VERBOSE=${DOCKER_STATUS_VERBOSE:-false}
DOCKER_STATUS_CACHE_TTL=${DOCKER_STATUS_CACHE_TTL:-30}  # seconds
DOCKER_STATUS_CACHE_FILE="/tmp/.docker-status-cache"

# Early termination if Docker is not installed
if ! command -v docker >/dev/null 2>&1; then
    return 0
fi

# Early termination if plugin is disabled
if [[ "$DOCKER_STATUS_ENABLED" != "true" ]]; then
    return 0
fi

# Early termination if running inside tmux session
if [[ -n "$TMUX" ]]; then
    return 0
fi

# Color definitions for output
typeset -A DOCKER_STATUS_COLORS
DOCKER_STATUS_COLORS=(
    'reset'     '\033[0m'
    'red'       '\033[0;31m'
    'green'     '\033[0;32m'
    'yellow'    '\033[0;33m'
    'blue'      '\033[0;34m'
    'purple'    '\033[0;35m'
    'cyan'      '\033[0;36m'
    'white'     '\033[0;37m'
    'bold'      '\033[1m'
    'dim'       '\033[2m'
)

# Function to print colored text
docker_status_print() {
    local color=$1
    local text=$2
    echo -e "${DOCKER_STATUS_COLORS[$color]}$text${DOCKER_STATUS_COLORS[reset]}"
}

# Function to check if Docker daemon is running
docker_status_daemon_running() {
    docker info >/dev/null 2>&1
}

# Function to get container status summary
docker_status_containers() {
    local running_count=0
    local stopped_count=0
    local running_containers=""
    local stopped_containers=""
    
    if ! docker_status_daemon_running; then
        docker_status_print "red" "🐳 Docker daemon is not running"
        return 1
    fi
    
    # Get container information
    local containers_info
    containers_info=$(docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" --no-trunc 2>/dev/null)
    
    if [[ -z "$containers_info" || "$containers_info" == "NAMES	STATUS	PORTS" ]]; then
        docker_status_print "dim" "🐳 No Docker containers found"
        return 0
    fi
    
    # Count running and stopped containers
    running_count=$(docker ps -q | wc -l)
    stopped_count=$(docker ps -aq --filter "status=exited" | wc -l)
    
    # Display container summary
    if [[ $running_count -gt 0 ]]; then
        running_containers=$(docker ps --format "{{.Names}}" | tr '\n' ', ' | sed 's/,$//')
        docker_status_print "green" "🟢 Running containers: $running_count ($running_containers)"
    fi
    
    if [[ $stopped_count -gt 0 ]]; then
        stopped_containers=$(docker ps -a --filter "status=exited" --format "{{.Names}}" | head -3 | tr '\n' ', ' | sed 's/,$//')
        if [[ $stopped_count -gt 3 ]]; then
            stopped_containers="${stopped_containers} (+$((stopped_count - 3)) more)"
        fi
        docker_status_print "yellow" "🟡 Stopped containers: $stopped_count ($stopped_containers)"
    fi
    
    if [[ $running_count -eq 0 && $stopped_count -eq 0 ]]; then
        docker_status_print "dim" "🐳 No containers found"
    fi
}

# Function to get Docker images status
docker_status_images() {
    if ! docker_status_daemon_running; then
        return 1
    fi
    
    local total_images
    local dangling_images
    local total_size
    
    total_images=$(docker images -q | wc -l)
    dangling_images=$(docker images -f "dangling=true" -q | wc -l)
    total_size=$(docker system df --format "table {{.Type}}\t{{.TotalCount}}\t{{.Size}}" 2>/dev/null | grep "Images" | awk '{print $3}')
    
    if [[ $total_images -gt 0 ]]; then
        docker_status_print "cyan" "🖼️  Images: $total_images total, ${total_size:-"unknown size"}"
        
        if [[ $dangling_images -gt 0 ]]; then
            docker_status_print "yellow" "⚠️  Dangling images: $dangling_images (consider cleanup)"
        fi
    else
        docker_status_print "dim" "🖼️  No Docker images found"
    fi
}

# Function to get Docker resource usage
docker_status_resources() {
    if ! docker_status_daemon_running; then
        return 1
    fi
    
    local container_count
    container_count=$(docker ps -q | wc -l)
    
    if [[ $container_count -eq 0 ]]; then
        return 0
    fi
    
    # Get system resource usage summary
    local disk_usage
    disk_usage=$(docker system df --format "table {{.Type}}\t{{.Size}}" 2>/dev/null | grep -E "(Images|Containers|Local Volumes)" | awk '{sum+=$2} END {print sum}')
    
    if [[ -n "$disk_usage" && "$disk_usage" != "0" ]]; then
        docker_status_print "blue" "💾 Docker disk usage: $(docker system df --format "{{.TotalCount}} items using {{.Size}}" | head -1 | awk '{print $4" "$5}')"
    fi
    
    # Show container resource stats if verbose mode is enabled
    if [[ "$DOCKER_STATUS_VERBOSE" == "true" ]]; then
        local container_stats
        container_stats=$(docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" 2>/dev/null | tail -n +2)
        
        if [[ -n "$container_stats" ]]; then
            docker_status_print "purple" "📊 Container resources:"
            echo "$container_stats" | while IFS= read -r line; do
                docker_status_print "dim" "   $line"
            done
        fi
    fi
}

# Function to check for system cleanup opportunities
docker_status_cleanup_suggestions() {
    if ! docker_status_daemon_running; then
        return 1
    fi
    
    local suggestions=()
    
    # Check for dangling images
    local dangling_count
    dangling_count=$(docker images -f "dangling=true" -q | wc -l)
    if [[ $dangling_count -gt 0 ]]; then
        suggestions+=("Run 'docker image prune' to remove $dangling_count dangling image(s)")
    fi
    
    # Check for stopped containers
    local stopped_count
    stopped_count=$(docker ps -aq --filter "status=exited" | wc -l)
    if [[ $stopped_count -gt 3 ]]; then
        suggestions+=("Run 'docker container prune' to remove $stopped_count stopped container(s)")
    fi
    
    # Check for unused volumes
    local unused_volumes
    unused_volumes=$(docker volume ls -f dangling=true -q | wc -l)
    if [[ $unused_volumes -gt 0 ]]; then
        suggestions+=("Run 'docker volume prune' to remove $unused_volumes unused volume(s)")
    fi
    
    # Display suggestions
    if [[ ${#suggestions[@]} -gt 0 ]]; then
        docker_status_print "yellow" "🧹 Cleanup suggestions:"
        for suggestion in "${suggestions[@]}"; do
            docker_status_print "dim" "   • $suggestion"
        done
    fi
}

# Function to check cache validity
docker_status_cache_valid() {
    if [[ ! -f "$DOCKER_STATUS_CACHE_FILE" ]]; then
        return 1
    fi
    
    local cache_age
    local file_time
    if command -v stat >/dev/null 2>&1; then
        # Try GNU stat first, then BSD stat
        file_time=$(stat -c %Y "$DOCKER_STATUS_CACHE_FILE" 2>/dev/null || stat -f %m "$DOCKER_STATUS_CACHE_FILE" 2>/dev/null || echo 0)
    else
        file_time=0
    fi
    cache_age=$(($(date +%s) - file_time))
    
    [[ $cache_age -lt $DOCKER_STATUS_CACHE_TTL ]]
}

# Main function to display Docker status
docker_status_show() {
    # Check cache first to avoid performance impact
    if docker_status_cache_valid && [[ "$DOCKER_STATUS_VERBOSE" != "true" ]]; then
        cat "$DOCKER_STATUS_CACHE_FILE" 2>/dev/null
        return 0
    fi
    
    # Capture output to variable, then display and cache
    local output
    output=$(
        docker_status_print "bold" "🐳 Docker System Status"
        echo
        
        docker_status_containers
        docker_status_images
        docker_status_resources
        
        if [[ "$DOCKER_STATUS_VERBOSE" == "true" ]] || [[ $(docker ps -q | wc -l) -gt 0 ]]; then
            echo
            docker_status_cleanup_suggestions
        fi
        
        echo
    )
    
    # Display output
    echo "$output"
    
    # Cache output (only if not verbose to avoid caching dynamic stats)
    if [[ "$DOCKER_STATUS_VERBOSE" != "true" ]]; then
        echo "$output" > "$DOCKER_STATUS_CACHE_FILE"
    fi
}

# Function to run Docker status check
_docker_status_background() {
    sleep 0.1
    docker_status_show
}

# Hook to run on shell initialization
if [[ "$DOCKER_STATUS_ENABLED" == "true" ]]; then
    # Try using zsh's precmd hook instead of immediate execution
    autoload -Uz add-zsh-hook
    
    _docker_status_first_run() {
        # Remove this hook after first run
        add-zsh-hook -d precmd _docker_status_first_run
        
        # Run Docker status in background with complete detachment
        {
            _docker_status_background
        } &|
    }
    
    add-zsh-hook precmd _docker_status_first_run
fi