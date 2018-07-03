#!/bin/sh
# Quick installation script for Linux Mint, removes/installs packages would be required by a typical user. 
# Adjusted for Ubuntu Mint 19 Tara


# Update repositories
sudo apt-get update

# Remove unnecessary components that the installation includes by default
sudo apt-get remove --purge thunderbird pidgin hexchat tomboy pix rhythmbox mintinstall mintwelcome timeshift -y
sudo apt-get remove --purge mintupdate -y
sudo apt-get autoremove -y
rm -r ~/Documents ~/Music ~/Videos ~/Public ~/Templates ~/Pictures


# Install 3rd party codecs (necessary for websites and playing video files)
sudo apt-get install adobe-flashplugin -y
sudo apt-get install gstreamer1.0-plugins-bad gstreamer1.0-libav -y


# Install typical scientific computation tools
if true; then
	# Install Octave. Second line provides some extra packages Octave complains about during image export.
	sudo apt-get install octave epstool pstoedit transfig -y
	sudo apt-get install g++ -y
	
	# Install Latex compiler
	sudo apt-get install texlive-latex-base texlive-latex-recommended -y
	sudo apt-get install inkscape -y	
fi

# Download and install google chrome
if false; then
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --tries=2
	sudo dpkg -i google-chrome*
	sudo apt-get install -f -y
	rm google*
fi

# Update the system and then remove the unpacked packages
sudo apt-get dist-upgrade -y
sudo apt-get clean


# Generate public encryption key pair (necessary for server authentications)
if false; then
	sudo apt-get install autossh
	ssh-keygen -t rsa -b 4096 <<- EOF
	
	
	
	EOF
fi
