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

# Clen up unnecessary files
RUN sudo rm -rf /var/lib/apt/lists/*
