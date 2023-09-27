require("telescope").load_extension("project")

require("telescope").setup {
  defaults = {
    previewer = false,
    file_ignore_patterns = {"build", "compile_commands.json", "node_modules", ".git", "dist", ".next", "out", ".png"},
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--iglob",
      "!yarn.lock",
      "--smart-case",
      "-u"
    },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    find_files = {
        find_command = {"rg", "--files", "--hidden", "--ignore-file", ".next", "--ignore-file", "out"},
        previewer = false,
    },
    file_browser = {
        hidden = true,
        previewer = false,
        theme = "dropdown",
    },
    buffers = {
        sort_lastused = true,
        previewer = false,
        theme = "dropdown",
    },
    oldfiles = {
        previewer = false,
    },
    colorscheme = {
      enable_preview = true
    }
},
  extensions = {
    project = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      base_dirs = {
        {path = "~/code", max_depth = 2}
      },
      hidden_files = true
    },
    bibtex = {
      format = 'plain'
    }
  }
}

require('telescope').load_extension('fzf')
