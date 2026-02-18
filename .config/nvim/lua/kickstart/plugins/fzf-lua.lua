return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    files = {
      file_icons = 'mini',
      find_opts = [[-type f \! -path '*/.git/*']],
      rg_opts = [[--color=never --hidden --files -g "!.git"]],
      fd_opts = [[--color=never --hidden --type f --type l --exclude .git]],
    },
  },
  keymaps = {
    fzf = {
      -- your other fzf binds
      -- modify the current 'toggle-all' bind:
      ['alt-a'] = 'select-all+accept',
    },
  },
  keys = {
    {
      '<leader>ff',
      function()
        require('fzf-lua').files { cmd = 'fd --type f --exclude node_modules/ --exclude .git/' }
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fnc',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind Neovim [C]onfig',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').files { cwd = vim.fs.root(0, '.git') }
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = '[F]ind Live [G]rep',
    },
    {
      '<leader>fv',
      mode = 'v',
      function()
        require('fzf-lua').grep_visual()
      end,
      desc = '[F]ind [V]irsual',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[F]ind [B]uffer',
    },
    {
      '<leader>fd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      desc = '[F]ind [D]iagnostics',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = '[F]ind [K]eymaps',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').spell_suggest()
      end,
      desc = '[F]ind [W]ords spell',
    },
    {
      '<leader>fc',
      function()
        require('fzf-lua').commands()
      end,
      desc = '[F]ind neovim [C]ommands',
    },
    {
      '<leader>fi',
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[F]ind Bu[I]ltin',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').blines()
      end,
      desc = '[F]ind [/] Fuzzily search in current buffer',
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').helptags()
      end,
      desc = '[F]ind [H]elps',
    },
    {
      '<leader>fm',
      function()
        require('fzf-lua').manpages()
      end,
      desc = '[F]ind [M]an',
    },
  },
}
