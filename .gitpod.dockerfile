# Use a lightweight Linux image
FROM gitpod/workspace-full

# Re-synchronize the OS package index
RUN sudo apt-get update

# Install all needed packages for all tools
RUN sudo apt-get install -y pdftk ghostscript imagemagick

# Clen up unnecessary files
RUN sudo rm -rf /var/lib/apt/lists/*
