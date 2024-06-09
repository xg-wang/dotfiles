#!/usr/bin/env bash

if [ "$BAT_THEME" = "gruvbox-light" ] ; then
	echo "Switching to Gruvbox Dark"
	export BAT_THEME="gruvbox-dark"
	kitty +kitten themes --reload=all "Gruvbox Dark"
	git config --global delta.syntax-theme gruvbox-dark
else
	echo "Switching to Gruvbox Light"
	export BAT_THEME="gruvbox-light"
	kitty +kitten themes --reload=all "Gruvbox Light"
	git config --global delta.syntax-theme gruvbox-light
fi
