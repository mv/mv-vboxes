###
### extra to 'vimrc'
###

if grep '^""" vimrc' /etc/vimrc
then
    echo
    echo "Skip..."
    echo
    exit 0
fi

cat >> /etc/vimrc <<EOF

""" vimrc additions

set nu
set nowrap

"olorscheme industry
colorscheme desert

EOF

echo
echo "Done..."
echo

# vim:ft=sh:

