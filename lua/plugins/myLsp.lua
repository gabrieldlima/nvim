return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
        opts = {
          ui = {
            border = "rounded",
            icons = {
              package_installed = " ",
              package_peding = " ",
              package_uninstalled = " ",
            },
          },
        },
      },

      {
        "folke/lazydev.nvim",
        ft = "lua",
        dependencies = {
          { "Bilal2453/luvit-meta", lazy = true }
        },
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },

      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          }
        },
      },
    },

    config = function ()
      -- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      --
      --  This function gets run when an LSP attaches to a particular buffer.
      --  That is to say, every time a new file is opened that is associated with
      --  an lsp (for example, opening `main.rs` is associated with `rust_analyzer`)
      --  this function will be executed to configure the current buffer
      --
      -- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function (event)
          vim.diagnostic.config({ virtual_text = false })
          vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

          -- LSP keymaps
          local keymap = function (keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          keymap("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          local builtin = require("telescope.builtin")
          keymap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
          keymap("gr", builtin.lsp_references, "[G]oto [R]eferences")
          keymap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
          keymap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
          keymap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
          keymap("<leader>ws", builtin.lsp_workspace_symbols, "[W]orkspace [S]ymbols")


          -- Highlight references of the word under the cursor
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function (event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
              end,
            })
          end
        end
      })


      -- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      --
      -- LSP servers and clients are able to communicate to each other what features
      -- they support. By default, Neovim doesn't support everything that is in the
      -- LSP specification. When you add nvim-cmp, luasnip, etc. Neovim now has *more*
      -- capabilities. So, we create new capabilities with nvim cmp, and then broadcast
      -- that to the servers.
      --
      -- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      local lsp_capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      end
      local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), lsp_capabilities)


      -- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      --
      -- Enable the following language servers. They will automatically be installed.
      -- Add any additional override configuration in the following tables:
      --
      --   1. cmd: Override the default command used to start the server.
      --   2. filetypes: Override the default list of associated filetypes.
      --   3. capabilities: Override fields in capabilities.
      --   4. settings: Override the default settings passed when initializing.
      --
      -- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      local lspconfig = require("lspconfig")
      local mlsp = require("mason-lspconfig")

      mlsp.setup {
        ensure_installed = {
          "lua_ls",
        },
        handlers = {
          -- default handler
          function (server_name)
            lspconfig[server_name].setup {
              capabilities = capabilities,
            }
          end,

          -- custom handlers
          ["lua_ls"] = function ()
            lspconfig.lua_ls.setup {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = {
                      "vim",
                    },
                  },
                },
              },
            }
          end,
        }
      }

      -- Manually installed servers
      local nixpath = "/home/gabriel/.nix-profile/bin/"

      -- NOTE: https://github.com/nix-community/nixd
      --
      lspconfig.nixd.setup {
        cmd = { nixpath .. "nixd" },
        filetypes = { "nix" },
        capabilities = capabilities,
        settings = {},
      }

      -- NOTE: https://github.com/MaskRay/ccls
      --
      -- lspconfig.ccls.setup {
      --   cmd = { nixpath .. "ccls" },
      --   filetypes = { "c", "h" },
      --   capabilities = capabilities,
      --   settings = {},
      -- }

      -- NOTE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd
      --
      lspconfig.clangd.setup {
        cmd = { nixpath .. "clangd" , "--background-index" },
        filetypes = { "c", "h" },
        capabilities = capabilities,
        settings = {},
      }
    end
  }
}
