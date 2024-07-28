return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
        config = function ()
          require("mason").setup {
            ui = {
              border = "rounded",
              icons = {
                package_installed = "✓",
                package_peding = "➜",
                package_uninstalled = "✗",
              },
            },
          }
        end
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
          local keymap = function (keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          keymap("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          vim.diagnostic.config({ virtual_text = false })

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

      -- manually installed
      lspconfig.nixd.setup {
        cmd = { "/home/gabriel/.nix-profile/bin/nixd" },
        filetypes = { "nix" },
        capabilities = capabilities,
        settings = {},
      }
    end
  }
}
