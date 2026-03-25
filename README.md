# 我的nvim配置

## Start


```
sudo pacman -S nvim yazi luarocks fzf wl-clipboard
git clone https://github.com/RumiTsukiSue/My-Config.nvim ~/.config/nvim
```



## 重置

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
