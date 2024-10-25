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
RUN wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz \
    $$ tar -xzf nvim-linux64.tar.gz \
    && mv nvim-linux64/bin/nvim /usr/local/bin/ \
    && rm -rf nvim-linux64.tar.gz nvim-linux64

# Install Neovim extras
RUN sudo apt-get install -y ripgrep fd-find xclip

# Alias
RUN echo "alias fd='fdfind'" >> ~/.bashrc

# Clone Neovim files
RUN git clone https://github.com/cirofabianbermudez/nvim.git /home/gitpod/.config/nvim

# Clen up unnecessary files
RUN sudo rm -rf /var/lib/apt/lists/*
