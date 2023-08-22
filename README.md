<h1 align="center">
    <a href="https://github.com/solsteace/dotfiles#neovim">Neovim</a> | 
    <a href="https://github.com/solsteace/dotfiles#windows-terminal-preview">Windows Terminal</a>| 
    <a href="https://github.com/solsteace/dotfiles#tmux">Tmux</a> |
    <a href="https://github.com/solsteace/dotfiles#konsole">Konsole</a> |
    <a href="https://github.com/solsteace/dotfiles#kitty">Kitty</a>
</h1>

<p>
    This is where I keep my settings I use<br>
    Feel free to use it for your own or as a reference! 
    I'll update these as the time goes on
</p>


# 🛠Installation
On your home directory, enter `git clone https://github.com/lancreate5/dotfiles.git`

> Most of the stuff should work without any extra work, except for the following
## Neovim
1. Install the following dependencies (More to come if saw any)
    - npm
    - GCC
1. Install Packer as plugin manager
    - Windows
        ```git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim```
    - UNIX
        ```git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"```
1. Run Neovim. If Packer not automatically installs the plugins, enter `:PackerSync`
1. ...

## Windows Terminal Preview
1. Replace the file or the content of the default `settings.json`, which can be found via the terminal's settings, the content of with `terminalPrev/settings.json`
