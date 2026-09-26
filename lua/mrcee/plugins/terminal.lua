return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "Codex", "CodexYolo", "LazyGit" },
    keys = {
      { "<leader>tt", desc = "Terminal: floating shell" },
      { "<leader>tg", desc = "Terminal: lazygit" },
      { "<leader>tc", desc = "Terminal: codex" },
      { "<leader>ty", desc = "Terminal: codex yolo" },
    },
    opts = {
      size = 18,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = false,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.92)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.86)
        end,
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      local function project_root()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 0 and git_root and git_root ~= "" then
          return git_root
        end
        return vim.fn.getcwd()
      end

      local function command_exists(name)
        return vim.fn.executable(name) == 1
      end

      local function notify_missing(name, install_hint)
        vim.notify(
          name .. " was not found on PATH." .. (install_hint and ("\n" .. install_hint) or ""),
          vim.log.levels.WARN,
          { title = "nvim-mrcee" }
        )
      end

      local function open_terminal(cmd, display_name)
        local term = Terminal:new({
          cmd = cmd,
          dir = project_root(),
          direction = "float",
          close_on_exit = false,
          hidden = true,
          display_name = display_name,
          env = {
            NVIM_MRCEE = "1",
          },
        })
        term:toggle()
      end

      local function open_shell()
        open_terminal(vim.o.shell, "shell")
      end

      local function open_lazygit()
        if not command_exists("lazygit") then
          notify_missing("lazygit", "Install with: brew install lazygit")
          return
        end
        open_terminal("lazygit", "lazygit")
      end

      local function open_codex(extra_args)
        if not command_exists("codex") then
          notify_missing("codex", "Install/login to Codex CLI first, then reopen Neovim.")
          return
        end

        local cmd = "codex"
        if extra_args and extra_args ~= "" then
          cmd = cmd .. " " .. extra_args
        end

        open_terminal(cmd, "codex")
      end

      vim.keymap.set("n", "<leader>tt", open_shell, { desc = "Terminal: floating shell" })
      vim.keymap.set("n", "<leader>tg", open_lazygit, { desc = "Terminal: lazygit" })
      vim.keymap.set("n", "<leader>tc", function()
        open_codex("")
      end, { desc = "Terminal: codex" })
      vim.keymap.set("n", "<leader>ty", function()
        open_codex("--yolo")
      end, { desc = "Terminal: codex yolo" })

      vim.api.nvim_create_user_command("Codex", function()
        open_codex("")
      end, { desc = "Open Codex CLI in the current project" })

      vim.api.nvim_create_user_command("CodexYolo", function()
        open_codex("--yolo")
      end, { desc = "Open Codex CLI in yolo mode in the current project" })

      vim.api.nvim_create_user_command("LazyGit", function()
        open_lazygit()
      end, { desc = "Open lazygit in the current project" })
    end,
  },
}
