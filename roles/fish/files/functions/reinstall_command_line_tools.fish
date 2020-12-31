function reinstall_command_line_tools
    set --local COMMAND_LINE_TOOLS_PATH /Library/Developer/CommandLineTools

    if test -e $COMMAND_LINE_TOOLS_PATH
        rm $COMMAND_LINE_TOOLS_PATH
        xcode-select --install
    else
        echo 'Command Line Tools doesn\'t exist'
        echo 'Installing'
        xcode-select --install
    end
end
