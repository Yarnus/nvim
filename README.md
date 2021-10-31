# About
<p align="center">
<img src="https://img.shields.io/badge/neovim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white"/>
<img src="https://img.shields.io/badge/lua-%232C2D72.svg?&style=for-the-badge&logo=lua&logoColor=white"/>
</p>


## Credit
- This project is originally base on [Avimitin/nvim](https://github.com/Avimitin/nvim)  ( I highly recommend it to be your first template.)
- It's originally inspired by
  - [theniceboy/nvim](https://github.com/theniceboy/nvim)
  - [siduck76/NvChad](https://github.com/siduck76/NvChad)
  - [glepnir/nvim](https://github.com/glepnir/nvim)

Anyway, take a look at their contribution, which is really fantastic.


## TODO
- [ ] Optimized neovim start up time based on each file
- [ ] Add guide and more screent

## Start up time test data
> Base on MBP 13 (2018, i5 2.3Ghz / 8 / 256)
```text
# Open only buffer
# nvim --startuptime /tmp/nvim-startuptime && tail -n 1 /tmp/nvim-startuptime | awk -F: '{print $1}'
# test it 3 times
041.010  000.008
040.462  000.002
042.642  000.002

# Open README.md
# nvim README.md --startuptime /tmp/nvim-startuptime && tail -n 1 /tmp/nvim-startuptime | awk -F: '{print $1}'
092.200  000.002
098.288  000.003
095.921  000.003

```
