#PLEASE EDIT PATHS TO YOUR LOCAL DIR WHEN RUNNING
echo "Starting all setups for Vim8.2"
cd ~
mkdir ~/.configs_backup
mkdir -p ~/.config/nvim/
cp ~/.bashrc ~/.configs_backup
cp ~/.vimrc ~/.configs_backup
cp ~/.tmux.conf ~/.configs_backup
cp ~/.config/nvim/init.vim ~/.configs_backup
echo "Current dotfile backups put in ~/.config_backups"
mkdir -p ~/.vim/undo_dir
scp hyldlog4:/runs/simrun_tav/tav_dev/.config/.* ~/
scp hyldlog4:/runs/simrun_tav/tav_dev/.config/init.vim ~/.config/nvim/
source ~/.bashrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
nvim -c :PlugInstall
