local M = {}

local function create_vimlist(table)
  local vimlist = "["
  local i = 1

  for _,v in pairs(table) do
    if i ~= 1 then
      vimlist = vimlist .. ","
    end

    vimlist = vimlist .. "'" .. v .. "'"
    i = i + 1
  end

  return vimlist .. "]"
end

local function add_buffer_to_bufbox()
  local bufbox = vim.g.bufbox
  local buf = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(buf)
  bufbox["k"..buf] = bufname

  vim.g.bufbox = bufbox
end

local function remove_buffer_from_bufbox()
  local bufbox = vim.g.bufbox
  local bufkey = "k"..vim.api.nvim_get_current_buf()

  bufbox[bufkey] = nil

  vim.g.bufbox = bufbox
end

local function display_bufbox()
  local buffers_vimlist = create_vimlist(vim.g.bufbox)
  local command = "call fzf#run(fzf#wrap({'source' : " .. buffers_vimlist
    .. ", 'window' : {'width': 0.5, 'height': 0.5}, 'fzf_action' : {'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit'}}))"

  vim.cmd(command)
end

M.setup = function ()
  vim.g.bufbox = {}
  vim.api.nvim_create_user_command("BufBoxAddBuffer", add_buffer_to_bufbox, {})
  vim.api.nvim_create_user_command("BufBoxRemoveBuffer", remove_buffer_from_bufbox, {})
  vim.api.nvim_create_user_command("BufBoxDisplay", display_bufbox, {})
end

return M
