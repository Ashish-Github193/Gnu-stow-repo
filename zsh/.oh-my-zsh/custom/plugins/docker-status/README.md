# Docker Status ZSH Plugin

A comprehensive Oh My Zsh plugin that displays Docker system status information when you start a new shell session. This plugin helps you keep track of running containers, resource usage, and cleanup opportunities without losing sight of what's happening in the background.

## Features

- **Container Status**: Shows running and stopped containers with names
- **Image Information**: Displays total images, sizes, and dangling image alerts
- **Resource Monitoring**: Shows disk usage and optional detailed container stats
- **Cleanup Suggestions**: Identifies cleanup opportunities for containers, images, and volumes
- **Performance Optimized**: Uses caching to minimize shell startup impact
- **Smart Detection**: Only activates if Docker is installed and daemon is running

## Installation

Since this is part of a GNU Stow repository:

1. The plugin is already created in the correct directory structure
2. Add `docker-status` to your plugins array in `.zshrc` (already done)
3. Run stow to create the symlinks:
   ```bash
   cd /home/x/Projects/Gnu-stow-repo
   stow -t ~ zsh
   ```
4. Start a new shell session or source your `.zshrc`

## Configuration

Add these variables to your `.zshrc` before the `source $ZSH/oh-my-zsh.sh` line to customize behavior:

```bash
# Enable/disable the plugin (default: true)
export DOCKER_STATUS_ENABLED=true

# Show detailed container resource stats (default: false)
export DOCKER_STATUS_VERBOSE=false

# Cache duration in seconds to avoid performance impact (default: 30)
export DOCKER_STATUS_CACHE_TTL=30
```

## Sample Output

### Basic Mode (default)
```
🐳 Docker System Status

🟢 Running containers: 2 (web-app, redis-cache)
🟡 Stopped containers: 1 (old-container)
🖼️  Images: 15 total, 2.3GB
💾 Docker disk usage: 3.1GB
⚠️  Dangling images: 3 (consider cleanup)

🧹 Cleanup suggestions:
   • Run 'docker image prune' to remove 3 dangling image(s)
   • Run 'docker container prune' to remove 1 stopped container(s)
```

### Verbose Mode
```
🐳 Docker System Status

🟢 Running containers: 2 (web-app, redis-cache)
🖼️  Images: 15 total, 2.3GB
💾 Docker disk usage: 3.1GB

📊 Container resources:
   web-app     12.34%    1.2GB / 8GB
   redis-cache 3.45%     256MB / 8GB
```

## Performance Considerations

- The plugin checks if Docker is installed before doing anything
- It uses a 30-second cache by default to avoid repeated Docker API calls
- Container stats are only shown in verbose mode to minimize startup delay
- The status check runs in the background to avoid blocking shell startup

## Manual Commands

You can also run the status check manually:

```bash
# Show current status (bypasses cache)
docker_status_show

# Enable verbose mode temporarily
DOCKER_STATUS_VERBOSE=true docker_status_show
```

## Troubleshooting

- If the plugin doesn't appear, ensure `docker-status` is in your plugins array
- If no output appears, check that Docker is installed and the daemon is running
- For performance issues, increase `DOCKER_STATUS_CACHE_TTL` or disable verbose mode
- To disable temporarily: `export DOCKER_STATUS_ENABLED=false` and restart shell

## Cleanup Commands

The plugin suggests these Docker cleanup commands when needed:

- `docker container prune` - Remove stopped containers
- `docker image prune` - Remove dangling images
- `docker volume prune` - Remove unused volumes
- `docker system prune` - Remove everything unused (use with caution)