function fish_neofetch
    # Call the fish_logo function and capture its output
    set fish_logo_output (fish_logo red f70 yellow '[' 'O')

    # Capture the output of neofetch
    set neofetch_output (neofetch)

    # Find the maximum number of lines in either output to ensure the loop covers all content
    set max_lines (math (max (count $fish_logo_output) (count $neofetch_output)))

    for i in (seq $max_lines)
        # Use string manipulation to ensure that each line has a fixed width
        # Adjust the width (here 40) as needed to fit the fish logo or your terminal
        set fish_line (string sub -l 40 (echo $fish_logo_output[$i]))
        set neofetch_line (echo $neofetch_output[$i])

        # Print the fish line with padding, then the neofetch line
        printf "%-40s %s\n" "$fish_line" "$neofetch_line"
    end
end
