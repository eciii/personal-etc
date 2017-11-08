# -------------------------------------------------------------
# ~/.bashrc: User-specific configuration for interactive shells
# -------------------------------------------------------------


configure_shell_options() {
	HISTCONTROL=ignoreboth         # don't put duplicate lines or lines starting with space in the history.
	HISTSIZE=1000                  # history length
	HISTFILESIZE=2000              # history length
	shopt -s histappend            # append to the history file, don't overwrite it
	shopt -s checkwinsize          # check the window size after each command
	#shopt -s globstar             # the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
}

set_prompt() {
	# set variable identifying the chroot you work in
	if test -z "${debian_chroot:-}" && test -r /etc/debian_chroot; then
		debian_chroot=$(cat /etc/debian_chroot)
	fi

	# check if we are in a terminal that supports color (in this case xterm-color)
	case "$TERM" in
		xterm-color) color_prompt="yes";;
	esac

	# check for color support in the terminfo databse
	if test -x /usr/bin/tput && tput setaf 1 >&/dev/null; then
		color_prompt="yes"
	else
		color_prompt=
	fi

	# setup the prompt accordingly
	if test "$color_prompt" = "yes"; then
		PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	else
		PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	fi
	unset color_prompt force_color_prompt
}

set_tab_title() {
	# If this is an xterm or rxvt terminal emulator set the (tab and window) title to user@host:dir
	case "$TERM" in
		xterm*|rxvt*)
			PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
			;;
		*)
			;;
	esac
}

define_aliases() {
	# enable color support for various commands
	if test -x /usr/bin/dircolors; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		alias ls='ls --color=auto'
		alias dir='dir --color=auto'		# dir is equivalent to 'ls -C -b'
		alias vdir='vdir --color=auto'		# vdir is equivalent to 'ls -l -b'

		alias grep='grep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias egrep='egrep --color=auto'
	fi

	# alias definitions
	alias lha='ls -lhAX --group-directories-first'
}

#configure_external_programs() {
#	# make less more friendly for non-text input files, see lesspipe(1)
#	test -x /usr/bin/lesspipe && eval "$(SHELL=/bin/sh lesspipe)"
#
#	# EXPORT OF CUSTOM VARIABLES
#	# colored GCC warnings and errors
#	export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#}


# -------------------------------------------------------------


# If not running interactively, don't do anything
test -z "$PS1" && return


# set the umask (this is a temporary workaround to a Debian bug)
# for more details see:
# https://unix.stackexchange.com/questions/395878/setting-umask-for-gnome-session
umask 0002


configure_shell_options
set_prompt
set_tab_title
define_aliases
#configure_external_programs
