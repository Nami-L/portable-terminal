# Use a lightweight Linux image
FROM gitpod/workspace-full

# Re-synchronize the OS package index
RUN sudo apt-get update

# Install basic tools
RUN sudo apt-get install -y pdftk ghostscript imagemagick

# Change ImageMagick policy
RUN sudo sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-6/policy.xml

# Install Gnuplot
RUN sudo apt-get install -y gnuplot

# Install LaTeX
RUN sudo apt-get install -y texlive-full

# Install Neovim 
RUN sudo apt-get install software-properties-common
RUN sudo add-apt-repository ppa:neovim-ppa/unstable
RUN sudo apt-get update
RUN sudo apt-get install neovim

# Install Neovim extras
RUN sudo apt-get install -y ripgrep fd-find xclip

# Alias
RUN echo "alias fd='fdfind'" >> ~/.bashrc

# Clone Neovim files
RUN git clone https://github.com/cirofabianbermudez/nvim.git $HOME/.config/nvim

# Clen up unnecessary files
RUN sudo rm -rf /var/lib/apt/lists/*
