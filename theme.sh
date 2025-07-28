#!/usr/bin/env bash

if [ "$BAT_THEME" = "gruvbox-light" ] ; then
	echo "Switching to Gruvbox Dark"
	export BAT_THEME="gruvbox-dark"
	git config --global delta.syntax-theme gruvbox-dark
	kitty +kitten themes --reload=all "Gruvbox Dark"
else
	echo "Switching to Gruvbox Light"
	export BAT_THEME="gruvbox-light"
	git config --global delta.syntax-theme gruvbox-light
	kitty +kitten themes --reload=all "Gruvbox Light"
fi
