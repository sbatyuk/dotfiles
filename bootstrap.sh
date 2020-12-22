#!/usr/bin/env bash

main() {
    ask_for_sudo
    install_xcode_command_line_tools # to get "git", needed for clone_dotfiles_repo
    clone_dotfiles_repo
    install_homebrew
    install_packages_with_brewfile
    change_shell_to_fish
    install_pip_packages
    setup_symlinks # needed for setup_vim and setup_tmux
    setup_vim
    setup_tmux
    install_yarn_packages
    update_hosts_file
    setup_macOS_defaults
    update_login_items
}

DOTFILES_REPO=~/repos/dotfiles

function ask_for_sudo() {
    info "Prompting for sudo password"

    sudoers_timeout_url=https://raw.githubusercontent.com/sam-hosseini/dotfiles/master/sudoers/timeout
    sudoers_timeout_path=/private/etc/sudoers.d/timeout

    if sudo --validate; then
        if sudo wget --timeout=5 --tries=3 --quiet --output-document="${sudoers_timeout_path}" $sudoers_timeout_url; then
            success "sudoers timeout updated"
        fi
    else
        error "sudoers timeout update failed"
        exit 1
    fi
}

function install_xcode_command_line_tools() {
    info "Installing Xcode command line tools"

    if xcode-select --print-path &>/dev/null; then
        success "Xcode command line tools already exists"
    else
        xcode-select --install
        while true; do
            if xcode-select --print-path 2>/dev/null; then
                success "Xcode command line tools installation succeeded"
                break
            else
                substep "Xcode command line tools still installing..."
                sleep 20
            fi
        done
    fi
}

function install_homebrew() {
    info "Installing Homebrew"
    if hash brew 2>/dev/null; then
        success "Homebrew already exists"
    else
        url=https://raw.githubusercontent.com/Homebrew/install/master/install.sh
        if yes | /bin/bash -c "$(curl -fsSL ${url})"; then
            success "Homebrew installation succeeded"
        else
            error "Homebrew installation failed"
            exit 1
        fi
    fi
}

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

function change_shell_to_fish() {
    info "Fish shell setup"
    if grep --quiet fish <<< "$SHELL"; then
        success "Fish shell already exists"
    else
        user=$(whoami)
        substep "Adding Fish executable to /etc/shells"
        if grep --fixed-strings --line-regexp --quiet \
            "/usr/local/bin/fish" /etc/shells; then
            substep "Fish executable already exists in /etc/shells"
        else
            if echo /usr/local/bin/fish | sudo tee -a /etc/shells > /dev/null;
            then
                substep "Fish executable successfully added to /etc/shells"
            else
                error "Failed to add Fish executable to /etc/shells"
                exit 1
            fi
        fi
        substep "Switching shell to Fish for \"${user}\""
        if sudo chsh -s /usr/local/bin/fish "$user"; then
            success "Fish shell successfully set for \"${user}\""
        else
            error "Please try setting Fish shell again"
        fi
    fi
}

function install_pip_packages() {
    info "Installing pip packages"
    REQUIREMENTS_FILE=${DOTFILES_REPO}/pip/requirements.txt

    if pip3 install -r "$REQUIREMENTS_FILE" 1> /dev/null; then
        success "pip packages successfully installed"
    else
        error "pip packages installation failed"
        exit 1
    fi

}

function install_yarn_packages() {
    # prettier for Neoformat to auto-format files
    # typescript for YouCompleteMe
    info "Installing yarn packages"

    if ( cd ~/.config/yarn/global; yarn global add &>/dev/null); then
        success "yarn packages successfully installed"
    else
        error "yarn packages installation failed"
        exit 1
    fi

}

function clone_dotfiles_repo() {
    info "Cloning dotfiles repository into ${DOTFILES_REPO}"
    if test -e $DOTFILES_REPO; then
        substep "${DOTFILES_REPO} already exists"
        pull_latest $DOTFILES_REPO
        success "Pull successful in ${DOTFILES_REPO} repository"
    else
        url=https://github.com/sam-hosseini/dotfiles.git
        if git clone "$url" $DOTFILES_REPO && \
           git -C $DOTFILES_REPO remote set-url origin git@github.com:sam-hosseini/dotfiles.git; then
            success "Dotfiles repository cloned into ${DOTFILES_REPO}"
        else
            error "Dotfiles repository cloning failed"
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
    APPLICATION_SUPPORT=~/Library/Application\ Support

    info "Setting up symlinks"

    symlink "git"           ${DOTFILES_REPO}/git/gitconfig              ~/.gitconfig
    symlink "hammerspoon"   ${DOTFILES_REPO}/hammerspoon                ~/.hammerspoon
    symlink "karabiner"     ${DOTFILES_REPO}/karabiner                  ~/.config/karabiner
    symlink "tmux"          ${DOTFILES_REPO}/tmux/tmux.conf             ~/.tmux.conf
    symlink "vim"           ${DOTFILES_REPO}/vim/vimrc                  ~/.vimrc
    symlink "starship"      ${DOTFILES_REPO}/starship/starship.toml     ~/.config/starship.toml

    # Disable shell login message
    symlink "hushlogin" /dev/null ~/.hushlogin

    symlink "fish:functions"   ${DOTFILES_REPO}/fish/functions    ~/.config/fish/functions
    symlink "fish:config.fish" ${DOTFILES_REPO}/fish/config.fish  ~/.config/fish/config.fish
    symlink "fish:plugins"     ${DOTFILES_REPO}/fish/fish_plugins ~/.config/fish/fish_plugins

    symlink "yarn:package.json"  ${DOTFILES_REPO}/yarn/global-package.json  ~/.config/yarn/global/package.json
    symlink "yarn:yarn.lock"     ${DOTFILES_REPO}/yarn/global-yarn.lock     ~/.config/yarn/global/yarn.lock

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

function update_hosts_file() {
    info "Updating /etc/hosts"
    base_hosts_file_path=${DOTFILES_REPO}/hosts/base_hosts_file
    own_hosts_file_path=${DOTFILES_REPO}/hosts/own_hosts_file
    ignored_keywords_path=${DOTFILES_REPO}/hosts/ignored_keywords
    downloaded_hosts_file_path=/etc/downloaded_hosts_file
    downloaded_updated_hosts_file_path=/etc/downloaded_updated_hosts_file
    community_hosts_file_url=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-social/hosts

    if cat ${base_hosts_file_path} ${own_hosts_file_path} | sudo tee /etc/hosts > /dev/null; then
        substep "Copying dotfiles hosts files to /etc/hosts succeeded"
    else
        error "Copying ${own_hosts_file_path} to /etc/hosts failed"
        exit 1
    fi

    if sudo wget --timeout=5 --tries=3 --quiet --output-document="${downloaded_hosts_file_path}" \
        $community_hosts_file_url; then
        substep "hosts file downloaded successfully"

        if rg --invert-match "$(cat ${ignored_keywords_path})" "${downloaded_hosts_file_path}" | \
            sudo tee "${downloaded_updated_hosts_file_path}" > /dev/null; then
            substep "Ignored patterns successfully removed from downloaded hosts file"
        else
            error "Failed to remove ignored patterns from downloaded hosts file"
            exit 1
        fi

        if cat "${downloaded_updated_hosts_file_path}" | \
            sudo tee -a /etc/hosts > /dev/null; then
            success "/etc/hosts updated"
        else
            error "Failed to update /etc/hosts"
            exit 1
        fi

    else
        error "Failed to download hosts file"
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
