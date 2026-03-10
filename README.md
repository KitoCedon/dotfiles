# Arch Description

---

## Core

- networkmanager
- clash-verge
- daed
- niri
- [DesktopEnvironment](#de)

---

### DE

#### Single Component

- waybar

#### Shell

- noctalia

### clash-verge

### daed

### niri

---

## Tools

- [emacs](#emacs)
- [yazi](#yazi)
- [lazygit](#lazygit)
- [showmethekey](#showmethekey)

---

### yazi

#### Presetting

- [Set `y` instead of yazi](https://yazi-rs.github.io/docs/quick-start#shell-wrapper)

#### Preinstalled

- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)

#### Plugins

- [yazi-rs/plugins:git](https://github.com/yazi-rs/plugins/tree/main/git.yazi)
- [yazi-rs/plugins:full-border](https://github.com/yazi-rs/plugins/tree/main/full-border.yazi)
- [yazi-rs/plugins:mount](https://github.com/yazi-rs/plugins/tree/main/mount.yazi)
- [Rolv-Apneseth/starship](https://github.com/Rolv-Apneseth/starship.yazi)
- lazygit Just need to add code below in ~/.config/yazi/keymap.toml

```
[[mgr.prepend_keymap]]
on   = [ "g", "i" ]
run  = "shell --block --orphan lazygit"
desc = "run lazygit"
```

##### Optional-yazi-plugins

- [llanosrocas/yaziline](https://github.com/llanosrocas/yaziline.yazi)
- [h-hg/yamb](https://github.com/h-hg/yamb.yazi)
- [boydaihungst/simple-tag](https://github.com/boydaihungst/simple-tag.yazi)
- [llanosrocas/githead](https://github.com/llanosrocas/githead.yazi)
- [SUSTech-data/max-preview](https://github.com/SUSTech-data/max-preview.yazi)
- [sharklasers996/eza-preview](https://github.com/sharklasers996/eza-preview.yazi)
- [alterkeyy/wl-clipboard.yazi](https://github.com/alterkeyy/wl-clipboard.yazi)
- [*grappas/wl-clipboard(broken)*](https://github.com/grappas/wl-clipboard.yazi)

#### Flavors

- [yazi-rs/flavors:dracula](https://github.com/yazi-rs/flavors/tree/main/catppuccin-mocha.yazi)
- [icons-brew](https://github.com/lpnh/icons-brew.yazi)

##### Optional-yazi-flavors

- [yazi-rs/flavors:catppuccin-mocha](https://github.com/yazi-rs/flavors/tree/main/dracula.yazi)

### showmethekey

### emacs

> - <https://jblevins.org/projects/markdown-mode/>

- may need to use M-x customize-variable display-line-numbers-type to set relative-line-number
- simpc-mode is optional

---

## Others

### Music

- cava
- go-musicfox

### ASCII art

- chafa
- cmatrix
- figlet

### Game

- steam
- protonplus
