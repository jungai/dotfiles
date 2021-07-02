if !exists('g:loaded_telescope') | finish | endif

" Using lua functions
nnoremap <silent>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <silent>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
        "node_modules/.*",
        "dist/.*",
        "out/.*"
    },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF
