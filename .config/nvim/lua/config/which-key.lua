
require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {
            min = 4,
            max = 25
        }, -- min and max height of the columns
        width = {
            min = 20,
            max = 50
        }, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {
    noremap = true,
    silent = true
})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {
    noremap = true,
    silent = true
})
-- window
vim.api.nvim_set_keymap('n','<leader>w','<C-w>',{
        noremap=true,
        silent=true
})
-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', {
    noremap = true,
    silent = true
})

-- dashboard
vim.api.nvim_set_keymap('n', '<Leader>;', ':Dashboard<CR>', {
    noremap = true,
    silent = true
})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {
    noremap = true,
    silent = true
})

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>x", ":BufferClose<CR>", {
    noremap = true,
    silent = true
})

-- TODO create entire treesitter section

local mappings = {
    ["/"] = "Comment",
    ["x"] = "Close Buffer",
    ["e"] = "Explorer",
    ["f"] = "Find File",
    ["h"] = "No Highlight",
    d = {
        name = "+Debug",
        t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      },
    
    g = {
        name = "+Git",
        j = {"<cmd>NextHunk<cr>", "Next Hunk"},
        k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
        p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
        s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
        u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"}
    },
    l = {
        name = "+LSP",
        a = { "<cmd>lua require('config.telescope').code_actions()<cr>", "Code Action" },
        d = {
          "<cmd>Telescope lsp_document_diagnostics<cr>",
          "Document Diagnostics",
        },
        w = {
          "<cmd>Telescope lsp_workspace_diagnostics<cr>",
          "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = {
          "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
          "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        p = {
          name = "Peek",
          d = { "<cmd>lua require('config.peek').Peek('definition')<cr>", "Definition" },
          t = { "<cmd>lua require('config.peek').Peek('typeDefinition')<cr>", "Type Definition" },
          i = { "<cmd>lua require('config.peek').Peek('implementation')<cr>", "Implementation" },
        },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
    },

    s = {
        name = "+Search",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"}
    },
    S = {
        name = "+Session",
        s = {"<cmd>SessionSave<cr>", "Save Session"},
        l = {"<cmd>SessionLoad<cr>", "Load Session"}
    },
    c={
        name="+c per",
        r={"<cmd>:lua cPer.runCode()<cr>","run c code"},
        d={"<cmd>Dox<cr>","insert doc block"},
        u={"<cmd>DoxUndoc<cr>","insert doc block"},


    },
    t = {
       name = '+terminal' ,
       o={'<cmd>FloatermNew --wintype=popup --height=6<cr>', 'terminal'},
       f ={'<cmd>FloatermNew fzf<cr>','fzf'},
       g={'<cmd>FloatermNew lazygit<cr>', 'git'},
      -- 'd' : [':FloatermNew lazydo<cr>cker'                        , 'docker'],
       n = {'<cmd>FloatermNew node<cr>', 'node'},
    --   N= { '<cmd>FloatermNew nnn' , 'nnn'},
       p={ '<cmd>FloatermNew python<cr>', 'python'},
       --r={ '<cmd>FloatermNew ranger', 'ranger'},
       t= {'<cmd>FloatermToggle<cr>','toggle'},
       y = {'<cmd>FloatermNew ytop<cr>','ytop'},
       --s= {'<cmd>FloatermNew ncdu','ncdu'},
       },
       w={
               name= "+window",
               s = "Split window",
               v = "Split window vertically",
               w = "Switch windows",
               q = "Quit a window",
               T = "Break out into a new tab",
               x = "Swap current with next",
               ["-"] = "Decrease height",
               ["+"] = "Increase height",
               ["<lt>"] = "Decrease width",
               [">"] = "Increase width",
               ["|"] = "Max out the width",
               ["="] = "Equally high and wide",
               h = "Go to the left window",
               l = "Go to the right window",
               k = "Go to the up window",
               j = "Go to the down window",
       },
       
}

local wk = require("which-key")
wk.register(mappings, opts)
