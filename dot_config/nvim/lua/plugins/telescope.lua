local function get_base_path (path)
  local base_path, _, _ = string.match(path, "(.-)([^\\/]-%.?([^%.\\/]*))$")
  local last_char = string.sub(base_path, -1)
  -- remove trainling slash or backslash
  if last_char == "/" or last_char == "\\" then
    base_path = string.sub(base_path, 1, -2)
  end
  return base_path
end


local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
telescope.setup{
  defaults = {
    prompt_prefix = "λ -> ",
    selection_caret = "|> ",
    winblend = 20,
    show_line = false,
    set_env = { ["COLORTERM"] = "truecolor" },
    -- Don't pass to normal mode with ESC, problem with telescope-project
    -- mappings = {
    --   i = {
    --     ["<esc>"] = actions.close,
    --   },
    -- },
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    
  }
}

-- Extensions

telescope.load_extension('octo')
telescope.load_extension('fzy_native')
telescope.load_extension('project')
telescope.load_extension('neoclip')
telescope.load_extension('notify')
telescope.load_extension('harpoon')
telescope.load_extension('dap')

-- Implement delta as previewer for diffs

local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local conf = require('telescope.config')
local M = {}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- this is for status
    -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
    -- just do an if and return a different command
    if entry.status == '??' or 'A ' then
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
    end

    -- note we can't use pipes
    -- this command is for git_commits and git_bcommits
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }

  end
}

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

M.my_git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

M.my_note = function(opts)
  builtin.live_grep { prompt_title = ' Note ', cwd = '~/Note' }
end

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

function _activate_conda_env()
  require'telescope'.extensions.conda.conda{}
  -- vim.g.python3_host_prog = vim.env.CONDA_DEFAULT_ENV .. '/bin/python'
end
vim.api.nvim_create_user_command('CondaEnvSelect', _activate_conda_env, { bang = true })
return M
