# Install guide on Windows - init.vim
1. Download [Neovim install zip file][]. Unzip it to `C:\Neovim\` folder (or any folder you like) and add `C:\Neovim\bin` to Windows environment PATH.
2. Copy `nvim` folder into `~\AppData\Local\` folder.
3. Start nvim-qt.exe, and run `:PlugInstall`, have a cup of tea and wait for done.
4. Copy external tools binary into `C:\Neovim\bin\` folder (or any folder in Windows env. PATH). It depends on what plugin you will use.
    - Ctags.exe  - used by [Tagbar][]
    - rg.exe     - used by [vim-ripgrep][]
    - cscope.exe - used by [CCTree][]
    - fzf.exe    - used by [fzf.vim][]
5. Restart `nvim-qt.exe`. Enjoy, explore, and tune with your style :-)

# Install guide on Windows - init.lua (TODO)
* Install Neovim
  * Option 1: https://github.com/neovim/neovim/releases/tag/stable
  * Option 2 by using winget: `winget install Neovim.Neovim`
    * https://github.com/neovim/neovim/wiki/Installing-Neovim
* Install dependencies
  * Nerd Fonts: https://webinstall.dev/nerdfont/
    * `curl.exe https://webi.ms/nerdfont | powershell`
    * "Droid Sans Mono for Powerline Nerd Font Complete.otf"
  * Python
  * Git
  * Node.js (optional): `winget upgrade Node.js`
* Install NvChad
  * https://nvchad.com/quickstart/install
  * https://github.com/NvChad/NvChad

# Add Shortcut for Windows
* Add Windows Sendto menu
  1. Create a `nvim-qt.exe` shortcut using Create Shortcut Wizard (right-click > Shortcut).
  2. Open the run window - WIN+R.
  3. Type `shell:sendto` in the run box. Then OK. That opens the "sendto" folder.
  4. Drag `nvim-qt.exe` shortcut from the desktop into the "sendto" folder.

* Make a Windows shortcut start relative to where the folder is
  1. Right-click on the `nvim-qt.exe` shortcut and select “Properties”.
  2. Under the “Shortcut” tab, add `%CD%` in “Start in” field.

# Misc Tips
* Run `%LOCALAPPDATA%` in Windows file explorer to open `~\AppData\Local\` folder.
