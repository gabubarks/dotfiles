# dotfiles

### Generic packages
```bash
sudo apt install keepassxc
```

### Fonts
```bash
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Monofur.zip
mkdir -p ~/.fonts/Monofur/
unzip Monofur.zip -d ~/.fonts/Monofur/
rm Monofur.zip
```

### Nvim
```bash
cargo install bob
bob install stable
bob use stable
stow nvim
```

### Spacemacs
https://github.com/syl20bnr/spacemacs

```bash
sudo apt install emacs
stow spacemacs
```kkk
