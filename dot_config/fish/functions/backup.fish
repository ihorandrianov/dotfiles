function backup --description "Create a timestamped backup of a file"
    if test -e "$argv[1]"
        # Create a backup with .bak extension and timestamp
        cp -- "$argv[1]" "$argv[1].bak."(date +%Y%m%d-%H%M%S)
        echo "Backup of '$argv[1]' created."
    else
        echo "Error: File '$argv[1]' not found."
        return 1
    end
end
