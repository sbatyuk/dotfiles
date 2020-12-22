function update_homebrew
    mas upgrade

    brew update
    brew upgrade
    brew outdated --cask --greedy --verbose | rg --invert-match latest | awk '{print $1;}' | xargs brew upgrade --cask
    brew cleanup
    brew doctor
end
