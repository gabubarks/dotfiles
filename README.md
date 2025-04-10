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
fc-cache -fv
rm Monofur.zip
```

### Bash
```bash
stow bash
```

### Tmux
```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

stow tmux
```

### Nvim
```bash
cargo install bob
bob install stable
bob use stable
echo 'PATH="$HOME/.local/share/bob/nvim-bin:$PATH"' >> ~/.bashrc

stow nvim
```

### Spacemacs
https://github.com/syl20bnr/spacemacs

```bash
sudo apt install emacs
stow spacemacs
```kkk
