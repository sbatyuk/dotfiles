function update_homebrew
    mas upgrade | grep --invert-match "Everything is up-to-date"

    brew update | grep --invert-match "Already up-to-date."
    brew upgrade
    brew outdated --cask --greedy --verbose | grep --invert-match latest | awk '{print $1;}' | xargs brew upgrade --cask
    brew cleanup
    brew doctor | grep --invert-match "Your system is ready to brew."
end
