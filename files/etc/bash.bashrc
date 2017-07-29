# ------------------------------------------------------------------
# /etc/bash.bashrc: System-wide configuration for interactive shells
# ------------------------------------------------------------------


# TODO set also the PROMP_COMMAND envvar with more functionality (git? ssh?)
set_prompt() {

	# set variable identifying the chroot we are working in
	if test -z "${debian_chroot:-}" && test -r /etc/debian_chroot; then
		debian_chroot=$(cat /etc/debian_chroot)
	fi

	# set the prompt accordingly
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

}


# ------------------------------------------------------------------


# if not running interactively, don't do anything
test -z "$PS1" && return


set_prompt
