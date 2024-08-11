local tool = {}

tool["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
-- This is specifically for fcitx5 users who code in languages other than English
-- tool["pysan3/fcitx5.nvim"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	cond = vim.fn.executable("fcitx5-remote") == 1,
-- 	config = require("tool.fcitx5"),
-- }
tool["Bekaboo/dropbar.nvim"] = {
	lazy = false,
	config = require("tool.dropbar"),
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
}
tool["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	config = require("tool.nvim-tree"),
}
tool["ibhagwan/smartyank.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("tool.smartyank"),
}
tool["michaelb/sniprun"] = {
	lazy = true,
	-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
	-- if you encountered error about no executable sniprun found.
	build = "bash ./install.sh",
	cmd = { "SnipRun", "SnipReset", "SnipInfo" },
	config = require("tool.sniprun"),
}
tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}
tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("tool.which-key"),
}
tool["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("tool.wilder"),
	dependencies = { "romgrk/fzy-lua-native" },
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	ft = { "mason" },
	lazy = true,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "jvgrootveld/telescope-zoxide" },
		{ "debugloop/telescope-undo.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-frecency.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
		{
			"FabianWirth/search.nvim",
			config = require("tool.search"),
		},
		{
			"ahmedkhalf/project.nvim",
			event = { "CursorHold", "CursorHoldI" },
			config = require("tool.project"),
		},
		{
			"aaronhallaert/advanced-git-search.nvim",
			cmd = { "AdvancedGitSearch" },
			dependencies = {
				"tpope/vim-rhubarb",
				"tpope/vim-fugitive",
				"sindrets/diffview.nvim",
			},
		},
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
tool["mfussenegger/nvim-dap"] = {
	lazy = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	config = require("tool.dap"),
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = require("tool.dap.dapui"),
			dependencies = {
				"nvim-neotest/nvim-nio",
			},
		},
		{ "jay-babu/mason-nvim-dap.nvim" },
	},
}

-- Flutter-tools PLugins
tool["akinsho/flutter-tools.nvim"] = {
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = true,
}

-- obsidian.nvim
tool["epwalsh/obsidian.nvim"] = {
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/danta-vault/",
			},
			{
				name = "work",
				path = "~/Documents/danta-vault/",
			},
		},
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},
	},
}

-- Codesnap.nvim
tool["mistricky/codesnap.nvim"] = {
	lazy = false,
	build = "make",
	opts = {
		save_path = "~/Pictures/Codesnap",
		has_breadcrumbs = true,
		has_line_number = true,
		bg_color = "#181825",
		bg_x_padding = 30,
		bg_y_padding = 20,
		bg_padding = nil,
		watermark = "",
		code_font_family = "JetBrains Mono",
	},
}

return tool
