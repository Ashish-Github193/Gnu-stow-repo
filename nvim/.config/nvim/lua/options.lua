vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.o.updatetime = 50
vim.o.termguicolors = true
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "1"

vim.g.python3_host_prog = "/home/x/.local/share/mise/installs/python/3.11.12/bin/python3"

vim.diagnostic.config({
  virtual_text = false,
  float = { "always" },
})

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabLine()"

vim.api.nvim_set_hl(0, "TabLine", { fg = "#666666", bg = "#222222" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffffff", bg = "#444444" })
vim.api.nvim_set_hl(0, "TabLineFill", { fg = "#666666", bg = "#222222" })

function _G.MyTabLine()
  local s = ""
  local tabcount = vim.fn.tabpagenr("$")

  for i = 1, tabcount do
    -- Get buffer information
    local buflist = vim.fn.tabpagebuflist(i)
    local name = "[No Name]"
    local modified = false

    -- Find a valid buffer name
    for _, bufnr in ipairs(buflist) do
      if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_get_option_value("buftype", { buf = bufnr }) == "" then
        local bufname = vim.fn.bufname(bufnr)
        if bufname ~= "" then
          name = vim.fn.fnamemodify(bufname, ":t")
          -- Check if buffer is modified
          modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
          break
        end
      end
    end

    -- Truncate long names
    if #name > 20 then
      name = string.sub(name, 1, 17) .. "..."
    end

    -- Set highlight group
    local hl = (i == vim.fn.tabpagenr()) and "%#TabLineSel#" or "%#TabLine#"

    -- Build tab label
    s = s .. hl .. " " .. i .. ": " .. name
    -- Add modified indicator
    if modified then
      s = s .. "[+]"
    end
    s = s .. " "
  end

  -- Fill remaining space
  return s .. "%#TabLineFill#%T"
end
