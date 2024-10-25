# Use a lightweight Linux image
FROM gitpod/workspace-full

# Re-synchronize the OS package index
RUN sudo apt-get update

# Install basic tools
RUN sudo apt-get install -y pdftk ghostscript imagemagick

# Install LaTeX
RUN sudo apt-get install -y texlive-full

# Clen up unnecessary files
RUN sudo rm -rf /var/lib/apt/lists/*
