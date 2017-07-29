# --------------------------------------------------------
# ~/.profile: user-specific configuration for login shells
# --------------------------------------------------------
# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login exists.


# include user's private bin in the $PATH if it exists
if test -d "$HOME/bin"; then
	PATH="$HOME/bin:$PATH"
fi


# if running bash interactively, include .bashrc
if test "$PS1" && test "$BASH" && test -f "$HOME/.bashrc"; then
	. "$HOME/.bashrc"
fi
