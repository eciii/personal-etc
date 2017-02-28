# ------------------------------------------------------------------
# /etc/bash.bashrc: System-wide configuration for interactive shells
# ------------------------------------------------------------------


# if not running interactively, don't do anything
[ -z "$PS1" ] && return


# setup of shell options
shopt -s checkwinsize


# setup the prompt - BEGIN
# TODO set also the PROMP_COMMAND envvar with more functionality (git? ssh?)
# 1. set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# setup the prompt accordingly
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# setup the prompt - END
