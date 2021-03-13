#!/bin/sh

cat ~/dotfiles/config/vs-code-extensions.txt | while read extension || [[ -n $extension ]];
do
	  code --install-extension $extension
	  #code --install-extension $extension --force
done
