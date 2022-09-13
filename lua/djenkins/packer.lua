
local header_art = 
[[

  _____ ____    ____  ____  _      __ __  ____  ___ ___ 
 / ___/|    \  /    ||    || |    |  |  ||    ||   |   |
(   \_ |  _  ||  o  | |  | | |    |  |  | |  | | _   _ |
 \__  ||  |  ||     | |  | | |___ |  |  | |  | |  \_/  |
 /  \ ||  |  ||  _  | |  | |     ||  :  | |  | |   |   |
 \    ||  |  ||  |  | |  | |     | \   /  |  | |   |   |
  \___||__|__||__|__||____||_____|  \_/  |____||___|___|
                                                        

     /^\    /^\
    {  O}  {  O}
     \ /    \ /
     //     //       _------_
    //     //     ./~        ~-_
   / ~----~/     /              \
 /         :   ./       _---_    ~-
|  \________) :       /~     ~\   |
|        /    |      |  :~~\  |   |
|       |     |      |  \___-~    |
|        \ __/`^\______\.        ./
 \                     ~-______-~\.
 .|                                ~-_
/_____________________________________~~____

]]


local starter = require('mini.starter')
starter.setup({
  -- evaluate_single = true,
  content_hooks = {
    function(content)
      local blank_content_line = { { type = 'empty', string = '' } }
      local section_coords = starter.content_coords(content, 'section')
      -- Insert backwards to not affect coordinates
      for i = #section_coords, 1, -1 do
        table.insert(content, section_coords[i].line + 1, blank_content_line)
      end
      return content
    end,
    starter.gen_hook.adding_bullet("» "),
    starter.gen_hook.aligning('center', 'center'),
  },
  header = header_art,
  footer = '',
})


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use { 'echasnovski/mini.nvim', branch = 'stable' }
  end)
	
