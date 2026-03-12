return {
  'ibhagwan/fzf-lua',
  config = function()
    require("fzf-lua").setup({
      winopts = { backdrop = 85 },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept"
        }
      },
    })
  end
}
