###
### extra to 'vimrc'
###

if grep '^# mv: Bash Options' /etc/bashrc
then
    echo
    echo "Skip..."
    echo
    exit 0
fi

cat >> /etc/bashrc <<EOF

# mv: Bash Options
shopt -s checkhash        # ignore CTRL-D at prompt
shopt -s cdspell          # corrects dir names
shopt -s cdable_vars      # enable 'cd mydir' for 'cd $mydir'
shopt -s cmdhist          # saves multines in one history line
#hopt -s mailwarn         # check mailfile

set -o vi
umask 002

export LANG=en_US.UTF-8

export HISTCONTROL='ignoredups:erasedups'
export HISTCONTROL='ignoredups'
export HISTIGNORE='&:ls:lr:ll:[bf]g:pwd'

EOF

echo
echo "Done..."
echo

# vim:ft=sh:

