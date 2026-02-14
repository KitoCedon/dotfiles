## Option
- [affinity(An alternative of PhotoShop)](https://www.affinity.studio/)
- 

## fontconfig
### setting record

#### Light DE Compatible GTK Applications
- https://wiki.archlinux.org/title/Font_configuration/Examples

## emacs
### setting record

#### 字体设置
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html
- https://github.com/tumashu/cnfonts

#### 中文字体设置
- https://www.gnu.org/savannah-checkouts/gnu/emacs/manual/html_node/emacs/Modifying-Fontsets.html
- https://www.gnu.org/software/emacs/manual/html_node/elisp/Fontsets.html#Fontsets
- https://emacs-china.org/t/topic/20216/12

0. fc-list | grep "Noto Sans CJK" etc. Confirm the Font you can use in the emacs.
1. use (M-x script-representative-chars) to confirm the charset of  (cjk-misc 12302 65292 12298 65289 23376) (kana 12363) (bopomofo 12549) (kanbun 12701) (han 23383)
2. add lisp script to set specialization font for cjk

## VSCode
### setting record

#### keyring
- https://code.visualstudio.com/docs/configure/settings-sync#_troubleshooting-keychain-issues
1. 尝试更换gnome-keyring

## OBS-Studio

### setting record

#### wayland -> Xwayland
- https://github.com/univrsal/input-overlay/wiki/Installation

> if there is no ".desktop" in your "~/.local/share/applications", cp from "/usr/share/applications"
1. edit option "Exec" to "env QT_QPA_PLATFORM=xcb obs"
