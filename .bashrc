# .bashrc

# User specific aliases and functions
alias ll="ls -la"
alias h="history"

if [ -f /etc/bashrc ]; then
       . /etc/bashrc
fi

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\$ '