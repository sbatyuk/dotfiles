#!/usr/bin/env bash

main() {
    install_packages_with_brewfile
    setup_symlinks # needed for setup_vim and setup_tmux
    setup_vim
    setup_tmux
    setup_macOS_defaults
    update_login_items
}

DOTFILES_REPO=~/repos/dotfiles

function install_packages_with_brewfile() {
    info "Installing Brewfile packages"

    TAP=${DOTFILES_REPO}/homebrew/tap
    BREW=${DOTFILES_REPO}/homebrew/brew
    CASK=${DOTFILES_REPO}/homebrew/cask
    MAS=${DOTFILES_REPO}/homebrew/mas

    if hash parallel 2>/dev/null; then
        substep "parallel already exists"
    else
        if brew install parallel &> /dev/null; then
            printf 'will cite' | parallel --citation &> /dev/null
            substep "parallel installation succeeded"
        else
            error "parallel installation failed"
            exit 1
        fi
    fi

    if (echo $TAP; echo $BREW; echo $CASK; echo $MAS) | parallel --verbose --linebuffer -j 4 brew bundle check --file={} &> /dev/null; then
        success "Brewfile packages are already installed"
    else
        if brew bundle --file="$TAP"; then
            substep "Brewfile taps installation succeeded"

            export HOMEBREW_CASK_OPTS="--no-quarantine"
            if (echo $BREW; echo $CASK; echo $MAS) | parallel --verbose --linebuffer -j 3 brew bundle --file={}; then
                success "Brewfile packages installation succeeded"
            else
                error "Brewfile packages installation failed"
                exit 1
            fi
        else
            error "Brewfile taps installation failed"
            exit 1
        fi
    fi
}

function pull_latest() {
    substep "Pulling latest changes in ${1} repository"
    if git -C $1 pull origin master &> /dev/null; then
        return
    else
        error "Please pull latest changes in ${1} repository manually"
    fi
}

function setup_vim() {
    info "Setting up vim"
    substep "Installing Vundle"
    if test -e ~/.vim/bundle/Vundle.vim; then
        substep "Vundle already exists"
        pull_latest ~/.vim/bundle/Vundle.vim
        substep "Pull successful in Vundle's repository"
    else
        url=https://github.com/VundleVim/Vundle.vim.git
        if git clone "$url" ~/.vim/bundle/Vundle.vim; then
            substep "Vundle installation succeeded"
        else
            error "Vundle installation failed"
            exit 1
        fi
    fi
    substep "Installing all plugins"
    if yes | vim +PluginInstall +qall 2> /dev/null; then
        substep "Plugins installations succeeded"
    else
        error "Plugins installations failed"
        exit 1
    fi
    success "vim successfully setup"
}

function setup_tmux() {
    info "Setting up tmux"
    substep "Installing tpm"
    if test -e ~/.tmux/plugins/tpm; then
        substep "tpm already exists"
        pull_latest ~/.tmux/plugins/tpm
        substep "Pull successful in tpm's repository"
    else
        url=https://github.com/tmux-plugins/tpm
        if git clone "$url" ~/.tmux/plugins/tpm; then
            substep "tpm installation succeeded"
        else
            error "tpm installation failed"
            exit 1
        fi
    fi

    substep "Installing all plugins"

    # sourcing .tmux.conf is necessary for tpm
    tmux source-file ~/.tmux.conf 2> /dev/null

    if ~/.tmux/plugins/tpm/bin/./install_plugins &> /dev/null; then
        substep "Plugins installations succeeded"
    else
        error "Plugins installations failed"
        exit 1
    fi
    success "tmux successfully setup"
}

function setup_symlinks() {
    info "Setting up symlinks"

    symlink "hammerspoon"   ${DOTFILES_REPO}/hammerspoon                ~/.hammerspoon
    symlink "karabiner"     ${DOTFILES_REPO}/karabiner                  ~/.config/karabiner
    symlink "tmux"          ${DOTFILES_REPO}/tmux/tmux.conf             ~/.tmux.conf
    symlink "vim"           ${DOTFILES_REPO}/vim/vimrc                  ~/.vimrc

    success "Symlinks successfully setup"
}

function symlink() {
    application=$1
    point_to=$2
    destination=$3
    destination_dir=$(dirname "$destination")

    if test ! -e "$destination_dir"; then
        substep "Creating ${destination_dir}"
        mkdir -p "$destination_dir"
    fi
    if rm -rf "$destination" && ln -s "$point_to" "$destination"; then
        substep "Symlinking for \"${application}\" done"
    else
        error "Symlinking for \"${application}\" failed"
        exit 1
    fi
}

function setup_macOS_defaults() {
    info "Updating macOS defaults"

    current_dir=$(pwd)
    cd ${DOTFILES_REPO}/macOS
    if bash defaults.sh; then
        cd $current_dir
        success "macOS defaults updated successfully"
    else
        cd $current_dir
        error "macOS defaults update failed"
        exit 1
    fi
}

function update_login_items() {
    info "Updating login items"

    if osascript ${DOTFILES_REPO}/macOS/login_items.applescript &> /dev/null; then
        success "Login items updated successfully "
    else
        error "Login items update failed"
        exit 1
    fi
}

function coloredEcho() {
    local exp="$1";
    local color="$2";
    local arrow="$3";
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput bold;
    tput setaf "$color";
    echo "$arrow $exp";
    tput sgr0;
}

function info() {
    coloredEcho "$1" blue "========>"
}

function substep() {
    coloredEcho "$1" magenta "===="
}

function success() {
    coloredEcho "$1" green "========>"
}

function error() {
    coloredEcho "$1" red "========>"
}

if [ "${1}" != "--source-only" ]; then
    main "${@}"
fi
