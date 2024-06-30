# BufBox

Small plugin that lets you manage your most frequently used buffers and quickly access them.

## Installation 

You have to have [fzf](https://github.com/junegunn/fzf) installed.

Then, simply add the link to this repo to your plugin manager. For example, with vim-plug:

`Plug 'tomimara52/nvim-bufbox'`

Once installed, add the following line to your nvim init file:

`require("nvim-bufbox").setup()`
## Usage

`:BufBoxAddBuffer` adds the current buffer to the buffer box. 

`:BufBoxRemoveBuffer` removes the current buffer to the buffer box.

`:BufBoxDisplay` opens a floating window where you can the buffer box.


When in the buffer box window, you can fuzzy search buffers and press enter to open the selected one.

You can also use the following keybindings:

`ctrl-t`    opens the buffer in a new tab.

`ctrl-x`    opens the buffer in a horizontal split.

`ctrl-v`    opens the buffer in a vertical split.
