# dot
Dot files for new OSX device.

## Usage
### config.fish
Make sure fish is installed. 

`brew install fish`

Copy config file to fish config folder.

`cp config.fish ~/.config/fish/`

### vimrc
Install the latest vim.

`brew install vim`

Install CMake

`brew install cmake`

Copy vimrc to home folder.

`cp vimrc ~/.vimrc`

Copy color schemes to .vim folder.

`cp -r colors ~/.vim/`

Install Vundle

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Install all plugins

`vim +PluginInstall +qall`

Compile YouCompleteMe plugin. (Check https://github.com/Valloric/YouCompleteMe for more language specific configs)

`cd ~/.vim/bundle/YouCompleteMe; ./install.py`

Install tern module

`cd ~/.vim/bundle/tern_for_vim; npm install tern`

Install ag

`brew install the_silver_searcher`

