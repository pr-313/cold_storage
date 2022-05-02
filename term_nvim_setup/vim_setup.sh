#!/bin/bash
pushd ~
echo "################################################################################################"
echo "Checking permissions ..."
bin_exists=0
tav_dev_exists=0
/runs/simrun_tav/libs/bin/ag --help > /dev/null && bin_exists=1
if [ $bin_exists -eq 1 ]; then
    echo "Access to bin -- OK"
else
    echo "Cannot access /runs/simrun_tav/libs/bin"
    # echo "Exiting"
    # exit
fi

cat /runs/simrun_tav/tav_dev/.config/pip.conf >> /dev/null && tav_dev_exists=1
if [ $tav_dev_exists -eq 1 ]; then
    echo "Access to dotfiles -- OK"
else
    echo "Cannot access /runs/simrun_tav/tav_dev"
    # echo "Exiting"
    # exit
fi

echo "################################################################################################"
echo "Starting all setups"
echo "Making Dirs"
cd ~
mkdir ~/.configs_backup
mkdir -p ~/.config/nvim/
mkdir -p ~/.goneovim
mkdir -p ~/.config/pip/
mkdir -p ~/.vim/undo_dir
mkdir -p ~/.nvim/undo_dir
echo "Making Dirs -- DONE"
echo "################################################################################################"

echo "Backing up current dotfiles ... "
cp -Lv ~/.bashrc ~/.configs_backup
cp -Lv ~/.zshrc ~/.configs_backup
cp -Lv ~/.vimrc ~/.configs_backup
cp -Lv ~/.goneovim/setting.toml ~/.configs_backup
cp -Lv ~/.tmux.conf ~/.configs_backup
cp -Lrv ~/.config/nvim ~/.configs_backup
cp -Lv ~/.config/pip/pip.conf ~/.configs_backup
echo "Current dotfile backups put in ~/.config_backup"
echo "################################################################################################"

echo "Copying dotfiles from bitbucket"
first_time=0
git clone https://bitbucket.micron.com/bbdc/scm/~pbharati/term_nvim_setup.git ~/term_nvim_setup && first_time=1
if [[ $first_time == 1 ]]; then
    cp -v ~/term_nvim_setup/certnew.p7b ~/
    cp -v ~/term_nvim_setup/vim_config_update_mail.txt ~/
    cp -svf ~/term_nvim_setup/.vimrc ~/.vimrc
    cp -svf ~/term_nvim_setup/setting.toml ~/.goneovim/
    rm -rvf ~/.config/nvim
    cp -srvf ~/term_nvim_setup/nvim ~/.config/
    cp -svf ~/term_nvim_setup/.bashrc ~/.bashrc
    cp -svf ~/term_nvim_setup/.zshrc ~/.zshrc
    cp -svf ~/term_nvim_setup/.tmux.conf ~/.tmux.conf

    echo "################################################################################################"
    echo "Setting up pip and terminal internet access "
    cp -v ~/term_nvim_setup/pip.conf ~/.config/pip/
    certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n MicronCA -i $HOME/certnew.p7b
    echo "################################################################################################"
    echo "################################################################################################"
    echo "Dowloading Plugins and Plugin Managers"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "Choose [y] whenever prompted"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
    git clone --depth 1 https://github.com/javier-lopez/tundle ~/.tmux/plugins/tundle
    ~/.fzf/install --all
    ~/.tmux/plugins/tundle/scripts/install_plugins.sh
    PATH=$PATH:/runs/simrun_tav/libs/bin npm config set strict-ssl false
    python3 -m pip install pynvim > /dev/null 2>&1 &
else
    omz update
    pushd ~/term_nvim_setup && git pull origin master && popd
    pushd ~/.fzf && git pull && popd
fi
source ~/.bashrc
printf "\n\n\nINSTALLING NVIM Plugins \nType \":qa\" then Press Enter to Exit after all are complete or if stuck\n"
echo "Press Enter to Start" && read 
nvim -S ~/term_nvim_setup/nvim_version_lock.vim
pushd ~/.vim/plugged/telescope-fzf-native.nvim/ && make && popd
if [[ $HOSTNAME == *"hyld"* ]]; then
    echo "In HYD!"
    user_exists=0
    cat /runs/simrun_tav/tav_dev/.vim_users | grep $USER > /dev/null && user_exists=1 && echo "User:$USER already in Mailing List"
    if [[ $user_exists -eq 0 ]]; then
        echo "User:$USER not in mailing list... Adding"
        echo $USER >> /runs/simrun_tav/tav_dev/.vim_users
    fi
else
    echo "NOT IN HYD CANNOT CHECK MAILING LIST"
fi
popd
nvim ~/vim_config_update_mail.txt
printf "\n\nPLEASE RUN source ~/.bashrc before proceeding\n\n"

