set --local --append OWN_PATH /usr/local/bin                        # Where brew symlinks most packages
set --local --append OWN_PATH /usr/local/sbin                       # Where brew symlinks some packages

set --global --export fish_user_paths $OWN_PATH
