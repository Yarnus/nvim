
# About
![nvim](https://img.shields.io/badge/require%20neovim-v0.6.0-red)
![language](https://img.shields.io/github/languages/top/Yarnus/nvim)
![Neovim Configuration Test](https://img.shields.io/github/workflow/status/Yarnus/nvim/Neovim%20Configuration%20Test?label=paker%20compile&logo=Github)
![last commit](https://img.shields.io/github/last-commit/Yarnus/nvim?color=yellow)

- My personal nvim configuration written in lua.


# Credit
- This project is originally base on [ayamir/nvimdots](https://github.com/ayamir/nvimdots) ( I highly recommend it to be your first template.)
- It's originally inspired by
  - [theniceboy/nvim](https://github.com/theniceboy/nvim)
  - [siduck76/NvChad](https://github.com/siduck76/NvChad)
  - [glepnir/nvim](https://github.com/glepnir/nvim)
  - [Avimitin/nvim](https://github.com/Avimitin/nvim) 

Anyway, take a look at their contribution, which is really fantastic.

# Installation
1. neovim v0.6 or later (please follow [neovim installation](https://github.com/neovim/neovim/wiki/Installing-Neovim).) 
2. nerdfont (most of chars are based on nerd font, therefore it's highly recommended to install [nerdfont](https://www.nerdfonts.com/font-downloads) for impressive icon support.)
3. other neovim dependency (for more details, please use `:checkhealth` in neovim.)
  - Install `pip3` and run `pip3 install --user pynvim`
  - Install `node` and run `npm install -g neovim`
  - Install `fzf`
4. run neovim then do `:PackerInstall`, after that run `:PackerCompile`
5. restart neovim and installation done. (ATM, some lsp/tree-sitter will download automatically.)

# TODO
- [ ] Optimized neovim start up time based on each file
- [ ] Add more docs and screenshot
- [ ] Start up time test data
