# dotfiles

### Generic packages
```bash
sudo apt install keepassxc
```

### Fonts
* https://github.com/adobe-fonts/source-code-pro
* https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono/Regular/complete

Copy TTF files to `~/.fonts`

### Spacemacs
https://github.com/syl20bnr/spacemacs

```bash
sudo apt install emacs
ln -s <dotfiles>/spacemacs.d/ .spacemacs.d
```

### PT
Download https://github.com/monochromegane/the_platinum_searcher/releases

Install to `/usr/local/bin/`

### i3
```bash
sudo apt install i3 i3blocks
ln -s <dotfiles>/i3 .i3
cd ~/.config
ln -s <dotfiles>/i3blocks i3blocks
ln -s <dotfiles>/dunst dunst
```
