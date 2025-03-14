#!/bin/bash

wordList=("GNUMAN" "GENTOO" "GCC" "Larry the cow" "PS3" "LLVM" "GCC" "CLang" "Portage" "Emerge" "Gotta catch em all" "Chicken boob" "Beetroot" "Booze" "Vape" "Linux" "Windows" "macOS" "Gentoo" "Arch" "Wake Up!")

while true; do
    sleep 1
    randomWord=${wordList[$RANDOM % ${#wordList[@]}]}
    
    # Simulate typing the random word and pressing Enter
    xdotool type "$randomWord"
    xdotool key Return  # Press Enter
done
