-- Set leader key to space
vim.g.mapleader = " "

-- Add diagnostics support for ALL to show in line errors using the LSP
vim.diagnostic.config({
  virtual_text = true, -- show error messages inline
  signs = true,        -- show signs in the gutter
  underline = true,    -- underline errors/warnings
  update_in_insert = false,
})

-- Enable relative line numbers
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- Use spaces instead of tabs, with 2 space wide tabs
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 2      -- Number of spaces for a tab
vim.opt.shiftwidth = 2   -- Number of spaces to use for indentation
vim.opt.softtabstop = 2  -- Number of spaces for editing (visual/insert mode)

-- Enable system clipboard support
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard

-- Enable line wrapping
vim.opt.wrap = false -- Disable line wrapping (set to true for word wrap)

-- Enable line numbering and relative numbers
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Relative line numbers

-- Enable auto-indentation and smart indentation
vim.opt.smartindent = true -- Smart indenting for new lines
vim.opt.autoindent = true  -- Auto indent new lines
vim.opt.smarttab = true    -- Insert tabs according to shiftwidth

-- Set search options for case-insensitive searching unless capital letters are used
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Override ignorecase if search contains uppercase letters

-- Show line and column number in the status line
vim.opt.ruler = true

-- Enable line numbers on the side
vim.opt.number = true

-- Enable mouse support
vim.opt.mouse = 'a' -- Enable mouse support in all modes

-- Set a decent scrolling buffer
vim.opt.scrolloff = 8 -- Keep 8 lines visible above and below the cursor

-- Highlight search results
vim.opt.hlsearch = true  -- Highlight all search results
vim.opt.incsearch = true -- Incremental search

-- Set a reasonable timeout for mappings
vim.opt.timeoutlen = 500 -- Timeout for mappings in milliseconds

-- Enable syntax highlighting (disabled to prevent issues with treesitter syntax highlighting)
-- vim.cmd('syntax enable')

-- Keep 8 lines below the cursor so you can see whats coming when scolling
vim.o.scrolloff = 8

-- Scroll centering
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("v", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("v", "<C-u>", "<C-u>zz", { noremap = true })

-- Search result centering
vim.keymap.set("n", "/", "/\\v", { noremap = true }) -- enable 'very magic' for search
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "*", "*zzzv", { noremap = true })
vim.keymap.set("n", "#", "#zzzv", { noremap = true })
vim.keymap.set("n", "g*", "g*zzzv", { noremap = true })
vim.keymap.set("n", "g#", "g#zzzv", { noremap = true })

-- Motion centering (normal mode)
vim.keymap.set("n", "gg", "ggzz", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true })
vim.keymap.set("n", "{", "{zz", { noremap = true })
vim.keymap.set("n", "}", "}zz", { noremap = true })

-- Motion centering (visual mode)
vim.keymap.set("v", "gg", "ggzz", { noremap = true })
vim.keymap.set("v", "G", "Gzz", { noremap = true })
vim.keymap.set("v", "{", "{zz", { noremap = true })
vim.keymap.set("v", "}", "}zz", { noremap = true })

-- Jump centering
vim.keymap.set("n", "<C-o>", "<C-o>zz", { noremap = true })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { noremap = true })

-- Remove search highlighting
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Set window title to current file name for files opened directly in nvim
vim.o.title = true
vim.o.titlestring = "%t"

-- Normal mode Alt+J/K for moving lines
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Visual mode Alt+J/K for moving lines
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
