return {
  "tpope/vim-obsession",
  lazy = false,
  config = function()
    -- Auto-track a Session.vim in the cwd so tmux-resurrect can restore it
    vim.api.nvim_create_autocmd("VimEnter", {
      nested = true,
      callback = function()
        if vim.fn.argc() > 0 or vim.g.this_obsession then
          return
        end
        if vim.fn.filereadable("Session.vim") == 1 then
          vim.cmd("silent! source Session.vim")
        end
        vim.cmd("silent! Obsession")
      end,
    })
  end,
}
