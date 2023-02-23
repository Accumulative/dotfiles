
- Change init1.vim to the required one before running create_symlinks.sh

# Format lua

```sh
npx @johnnymorganz/stylua-bin --glob nvim/.config/nvim/**/*.lua nvim/.config/nvim/init.lua --config-path ./stylua.toml
```