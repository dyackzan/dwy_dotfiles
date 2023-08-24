Sometimes clang doesn't work because the nvidia drivers install the wrong
libstdc++ package. Details on repairing that here:
https://stackoverflow.com/questions/74543715/usr-bin-ld-cannot-find-lstdc-no-such-file-or-directory-on-running-flutte

Otherwise I just followed the following instructions and video to install nvchad
* instructions: https://nvchad.com/
* video: https://www.youtube.com/watch?v=lsFoZIg-oDs 

There are some issues/ommisions within the instructions:
1. To install an updated version of nvim, go to
   https://github.com/neovim/neovim/releases/tag/v0.9.1 and download the
   nvim.appimage file and then move it to usr/bin and rename it to nvim
2. To install Nerd Font
  * Get JetBrains from: https://github.com/ryanoasis/nerd-fonts
Then:
```
mkdir ~/.local/share/fonts
unzip ~/Downloads/JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache ~/.local/share/fonts
```
(may need the -fv arg on fc-cache)
  * Then you might need to log out or at least restart the terminal before this
    takes effect. You can see if it works by looking at the terminal themes in
    your profile to see if you can change the font to what was just installed

Last, I installed the catpuccin themes. Did that for Chrome, tmux, nvim, and gnome-terminal.
https://catppuccin-website.vercel.app/ports
