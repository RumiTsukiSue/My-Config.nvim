# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Start

```
sudo pacman -S nvim
sudo pacman -S yazi
sudo pacman -S luarocks
sudo pacman -S fzf
sudo pacman -S wl-clipboard
git clone https://github.com/RumiTsukiSue/My-Config.nvim ~/.config/nvim
```


# 备份

备份的自定义配置或者备份整个配置目录
```
cp -r ~/.config/nvim ~/lazynvim_config_backup
```

# 重置

删除 Lazynvim 的配置目录
```
rm -rf ~/.config/nvim
```

删除 Neovim 的数据目录（这个目录包含了 Lazynvim 下载的插件、缓存、交换文件、undo 文件等）
```
rm -rf ~/.local/share/nvim
```

只删除lazy相关配置
```
rm -rf ~/.local/share/nvim/lazy
```

删除缓存
```
rm -rf ~/.cache/nvim
```


# 删除某个插件

删除相关配置文件
```
~/.config/nvim/lua/plugins/
```

检查
```
~/.config/nvim/init.lua
```

同步
```
:Lazy sync
```

清除缓存
```
rm -rf ~/.cache/nvim/
```


Lazy.nvim 实际存储所有下载的插件代码的地方。

一般不需要手动删除，如果插件是不再需要的，同步时会自动删除。
```
~/.local/share/nvim/lazy/
```


# git同步

```
# 1. 确保你在正确的仓库目录
cd ~/.config/nvim/

# 2. 检查状态，确保所有修改都已提交
git status

# 如果有未提交的修改：
# git add .
# git commit -m "Your commit message"

# 3. 拉取远程最新更改，避免冲突
git pull origin main

# 如果有冲突，解决冲突后：
# git add .
# git commit

# 4. 推送你的本地更改
git push -u origin main
```
