# Dotfiles

## Vim

`.vimrc` containing settings, key mappings and plugins I've found useful in my workflows.

### Installation

1. **Clone repository**: Clone this repository to a location of your choice.
   
    ```bash
    git clone https://github.com/m-evensen/dotfiles.git
    ```
    
2. **Symlink `.vimrc`**: Create a symlink to the `.vimrc` file in this repository.
   
    ```bash
    ln -s /path/to/dotfiles/.vimrc ~/.vimrc
    ```
    
3. **Install vim-plug**: If you haven't already, install [vim-plug](https://github.com/junegunn/vim-plug).
   
    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
    
4. **Install Plugins**: Open Vim and install the plugins by running `:PlugInstall` or typing `<space>1`.

5. **Install additional requirements**:
    - **ripgrep**: For efficient text search (installation varies by system).
    - **ctags**: For generating tags allowing navigation to symbols across the source code (installation varies by system).

6. **Install CoC extensions**: Install [CoC](https://github.com/neoclide/coc.nvim) extensions relevant to the programming languages you're planning to work with, e.g. `:CocInstall coc-python` for Python, `:CocInstall coc-java` for Java, etc. 
