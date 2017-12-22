# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ctrlp
cd ~/.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim

# nerdtree
git clone https://github.com/scrooloose/nerdtree.git bundle/nerdtree

# vim-coffee-script
git clone https://github.com/kchmck/vim-coffee-script.git bundle/vim-coffee-script/

# vim-fugitive
git clone https://github.com/tpope/vim-fugitive.git bundle/vim-fugitive/

cd
vim -E -c PlugInstall -c q