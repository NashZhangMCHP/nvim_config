# Neovim

My Neovim configuration.


## Directory
* `installer` folder contains necessary Neovim install files
  * [Neovim install zip file][] (you may use latest release)
  * `installer\user_home\.ctags` : support markdown file outline with [Tagbar][]. [Exuberant Ctags][] is needed. Copy this file into user home (`~`) folder.
  * External tools binary, such as Ctags.exe, rg.exe, cscope.exe, fzf.exe
* `nvim` folder contains Neovim configuration files. Put the folder at `~\AppData\Local\` folder
  * `nvim\init.vim`         : main configuration file
  * `nvim\ginit.vim`        : further GUI configuration file
  * `nvim\autoload\plug.vim`: [vim-plug manager]


## Install and Configure Neovim in Windows
1. Download [Neovim install zip file][]. Unzip it to `C:\Neovim\` folder (or any folder you like) and add `C:\Neovim\bin` to Windows environment PATH.
2. Copy `nvim` folder into `~\AppData\Local\` folder.
3. Start nvim-qt.exe, and run `:PlugInstall`, have a cup of tea and wait for done.
4. Copy external tools binary into `C:\Neovim\bin\` folder (or any folder in Windows env. PATH). It depends on what plugin you will use.
    - Ctags.exe  - used by [Tagbar][]
    - rg.exe     - used by [vim-ripgrep][]
    - cscope.exe - used by [CCTree][]
    - fzf.exe    - used by [fzf.vim][]
5. Restart `nvim-qt.exe`. Enjoy, explore, and tune with your style :-)

[Neovim install zip file]: <https://github.com/neovim/neovim/wiki/Installing-Neovim>
[vim-plug manager]: <https://github.com/junegunn/vim-plug)>
[Exuberant Ctags]: <http://ctags.sourceforge.net/>
[Universal Ctags]: <https://github.com/universal-ctags>
[Tagbar]: <https://github.com/majutsushi/tagbar>
[ripgrep]: <https://github.com/BurntSushi/ripgrep>
[vim-ripgrep]: <https://github.com/jremmen/vim-ripgrep>
[CCTree]: <https://github.com/vim-scripts/CCTree>
[fzf.vim]: <https://github.com/junegunn/fzf.vim>

*Note:*
1. Run `%LOCALAPPDATA%` in Windows file explorer to open `~\AppData\Local\` folder.
2. [Git](https://git-scm.com) is needed for vim-plug manager to clone plugins from GitHub.

## Further Setup Tips
* Add Windows Sendto menu
  1. Create a `nvim-qt.exe` shortcut using Create Shortcut Wizard (right-click > Shortcut).
  2. Open the run window - WIN+R.
  3. Type `shell:sendto` in the run box. Then OK. That opens the "sendto" folder.
  4. Drag `nvim-qt.exe` shortcut from the desktop into the "sendto" folder.

* Make a Windows shortcut start relative to where the folder is
  1. Right-click on the `nvim-qt.exe` shortcut and select “Properties”.
  2. Under the “Shortcut” tab, add `%CD%` in “Start in” field.


## Using Vim
* http://vimsheet.com/ (Vim Cheatsheets)
* https://hea-www.harvard.edu/~fine/Tech/vi.html (Vim Key Binding List)
* http://www.moolenaar.net/habits.html (Seven habits of effective text editing, by Bram Moolenaar)

