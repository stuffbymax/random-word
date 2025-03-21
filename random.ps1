$wordList = @("GNUMAN", "GENTOO", "GCC", "Larry the cow", "PS3", "LLVM", "GCC", "CLang", "Portage", "Emerge", "Gotta catch em all", "Chicken boob", "Beetroot", "Booze", "Vape", "Linux", "Windows", "macOS", "Gentoo", "Arch", "Wake Up!")

while ($true) {
    Start-Sleep -Seconds 1
    $randomWord = $wordList | Get-Random

    # Simulate typing the random word
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;
        public class KeyboardSimulator {
            [DllImport("user32.dll", CharSet = CharSet.Auto)]
            public static extern uint MapVirtualKey(uint uCode, uint uMapType);
            
            [DllImport("user32.dll")]
            public static extern int keybd_event(byte bVk, byte bScan, uint dwFlags, uint dwExtraInfo);
        }
"@

    $keyPress = $randomWord.ToCharArray()
    foreach ($char in $keyPress) {
        [KeyboardSimulator]::keybd_event([System.Text.Encoding]::ASCII.GetBytes($char)[0], 0, 0, 0)
        Start-Sleep -Milliseconds 100
        [KeyboardSimulator]::keybd_event([System.Text.Encoding]::ASCII.GetBytes($char)[0], 0, 2, 0)
        Start-Sleep -Milliseconds 50
    }

    # Simulate pressing Enter key
    [KeyboardSimulator]::keybd_event(0x0D, 0, 0, 0)  # 0x0D is the virtual key code for Enter
    Start-Sleep -Milliseconds 100
    [KeyboardSimulator]::keybd_event(0x0D, 0, 2, 0)  # Release Enter key
}
