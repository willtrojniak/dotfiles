local group = vim.api.nvim_create_augroup("TypstAutoSave", { clear = true })

local debounce_timer = nil

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  group = group,
  pattern = { "*.typ", "*.typst" },
  callback = function()
    if debounce_timer then
      vim.fn.timer_stop(debounce_timer)
      debounce_timer = nil
    end

    debounce_timer = vim.fn.timer_start(200, function()
      if vim.bo.modified
          and vim.bo.buftype == ""
          and vim.bo.modifiable
          and not vim.bo.readonly
      then
        vim.cmd("silent write")
      end
    end)
  end,
})
