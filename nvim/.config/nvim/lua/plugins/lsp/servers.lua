return {
	jsonls = {
		settings = {
			json = {
				schema = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			},
		},
	},
	bashls = {
		filetypes = { "sh", "zsh" },
	},
	vimls = {
		filetypes = { "vim" },
	},
	-- tsserver = {},
	-- ts_ls = {},
	vtsls = {
		settings = {
			typescript = {
				tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib", -- use project’s TS version
			},
		},
	},
	-- tailwindcss = {
	-- 	filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	-- },
	phpactor = {},
	-- intelephense = {},
	-- laravel_ls = {},
	glsl_analyzer = {
		filetypes = { "glsl", "glsl.js", ".glsl.js" },
	},
	gopls = {
		cmd = { "gopls", "-remote=auto" },
		-- attach to new filetypes too.
		filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtmltmpl", "gotexttmpl" },
		settings = {
			gopls = {
				-- see ftdetect/go.lua.
				["build.templateExtensions"] = { "gohtml", "html", "gotmpl", "tmpl" },
			},
		},
	},

	yamlls = {
		cmd = { "yaml-language-server", "--stdio" },
		filetypes = { "yaml" },
	},

	astro = {
		filetypes = { "astro" },
	},
}
