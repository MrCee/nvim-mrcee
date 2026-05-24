-- OSC52 clipboard support
--
-- Local desktop sessions should use their normal clipboard provider.
-- SSH, Linux, and Synology sessions use OSC52 so yanks can reach the local terminal clipboard.

local uv = vim.uv or vim.loop
local uname = uv.os_uname()
local sysname = uname and uname.sysname or ""

local is_linux = sysname == "Linux"
local is_ssh = vim.env.SSH_TTY ~= nil or vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil

if not (is_linux or is_ssh) then
  return
end

vim.g.clipboard = {
  name = "OSC52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

vim.opt.clipboard = "unnamedplus"
