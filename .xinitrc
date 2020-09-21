

xset +dpms
xset dpms 0 0 300
xsetroot -cursor_name left_ptr &

pgrep xbindkeys &> /dev/null || xbindkeys &> /dev/null &
pgrep redshift &> /dev/null || redshift &> /dev/null &
pgrep flameshot &> /dev/null || flameshot &> /dev/null &
pgrep dunst &> /dev/null || dunst &> /dev/null &

xmonad
source ~/.xsession
