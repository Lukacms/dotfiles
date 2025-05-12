return {
  "rcarriga/nvim-dap-ui",
  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")
    local original_keymaps = {}
    local original_mouse = vim.opt.mouse

    local function set_dapui_keymaps()
      local map = LazyVim.safe_keymap_set

      for _, key in ipairs({ "<Right>", "<Up>", "<Down>" }) do
        original_keymaps[key] = vim.fn.maparg(key, "n")
      end

      map("n", "<Right>", "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
      map("n", "<Up>", "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
      map("n", "<Down>", "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })

      original_mouse = vim.opt.mouse
      vim.opt.mouse = "a"
    end

    local function restore_keymaps()
      for key, mapping in pairs(original_keymaps) do
        if mapping ~= "" then
          vim.api.nvim_command("nnoremap " .. key .. " " .. mapping)
        else
          vim.api.nvim_del_keymap("n", key)
        end
      end

      vim.opt.mouse = original_mouse

      original_keymaps = {}
    end

    dapui.setup(opts)
    dap.listeners.after.event_initialized["dapui_keymap"] = function()
      dapui.open({})
      set_dapui_keymaps()
    end

    dap.listeners.before.event_terminated["dapui_keymap"] = function()
      dapui.close({})
      restore_keymaps()
    end

    dap.listeners.before.event_exited["dapui_keymap"] = function()
      dapui.close({})
      restore_keymaps()
    end
  end,
}
