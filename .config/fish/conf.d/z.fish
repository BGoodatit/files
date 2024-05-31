# Check if Z_DATA is unset and initialize it
if test -z "$Z_DATA"
    if test -z "$XDG_DATA_HOME"
        set -U Z_DATA_DIR "$HOME/.local/share/z"
    else
        set -U Z_DATA_DIR "$XDG_DATA_HOME/z"
    end
    set -U Z_DATA "$Z_DATA_DIR/data"
end

# Ensure the data file exists
if test ! -e "$Z_DATA"
    if test ! -e "$Z_DATA_DIR"
        mkdir -p -m 700 "$Z_DATA_DIR"
    end
    touch "$Z_DATA"
end

# Set Z_CMD if it's not already set
if test -z "$Z_CMD"
    set -U Z_CMD z
end

# Set ZO_CMD for opening target directories
set -U ZO_CMD "$Z_CMD"o

# Define function $Z_CMD if not empty
if test ! -z $Z_CMD
    function $Z_CMD -d "jump around"
        __z $argv
    end
end

# Define function $ZO_CMD if not empty
if test ! -z $ZO_CMD
    function $ZO_CMD -d "open target dir"
        __z -d $argv
    end
end

# Set up exclusions for z's tracking
if not set -q Z_EXCLUDE
    set -U Z_EXCLUDE "^$HOME\$"
else if contains $HOME $Z_EXCLUDE
    # Migrate old default values to a regex
    set Z_EXCLUDE (string replace -r -- "^$HOME\$" '^'$HOME'$$' $Z_EXCLUDE)
end

# Setup completions once first
__z_complete

# Automatically add to z's data when the current directory changes
function __z_on_variable_pwd --on-variable PWD
    __z_add
end

# Clean up z's settings and functions on uninstall
function __z_uninstall --on-event z_uninstall
    functions -e __z_on_variable_pwd
    functions -e $Z_CMD
    functions -e $ZO_CMD

    # Inform user about data cleanup
    if test ! -z "$Z_DATA"
        printf "To completely erase z's data, remove:\n" >/dev/stderr
        printf "%s\n" "$Z_DATA" >/dev/stderr
    end

    # Remove environment variables
    set -e Z_CMD
    set -e ZO_CMD
    set -e Z_DATA
    set -e Z_EXCLUDE
end
