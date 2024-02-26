# Dotfiles

## Vim

`.vimrc` containing settings, key mappings and plugins I've found useful in my workflows.

### Installation

1. **Clone repository**: Clone this repository to a location of your choice.
   
    ```bash
    git clone https://github.com/m-evensen/dotfiles.git
    ```
    
2. **Symlink `.vimrc`**: Create a symlink to the `.vimrc` file in this repository. Remember to back up your existing `.vimrc` file if you already have one.
   
    ```bash
    ln -s /path/to/dotfiles/.vimrc ~/.vimrc
    ```
    
3. **Create `~/.vim/tmp`**: Swap and undo files are saved to a common folder, make sure this folder exists.
   
    ```bash
    mkdir -p ~/.vim/tmp
    ```
    
4. **Install vim-plug**: If you haven't already, install [vim-plug](https://github.com/junegunn/vim-plug).
   
    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
    
5. **Install Plugins**: Open Vim and install the plugins by running `:PlugInstall` or typing `<space>1`.

6. **Install additional requirements**:
    - **ripgrep**: For efficient text search (installation varies by system).
    - **ctags**: For generating tags allowing navigation to symbols across the source code (installation varies by system).

7. **Install CoC extensions**: Install [CoC](https://github.com/neoclide/coc.nvim) extensions relevant to the programming languages you're planning to work with, e.g. `:CocInstall coc-pyright` for Python, `:CocInstall coc-java` for Java, etc. 
