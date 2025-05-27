require("core.basic")

require("core.keyboard")
require("core.lazy")
-- 创建自动命令组
local format_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

-- 使用 nvim_create_autocmd 绑定保存事件
vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_group,                   -- 绑定到自动命令组
      pattern = "*",                          -- 匹配所有文件类型
      callback = function()
            vim.lsp.buf.format({ async = false }) -- 同步格式化
      end
})
