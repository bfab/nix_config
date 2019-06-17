#can be either /etc/screenrc (but you may not have write access to it) or ~/.screenrc
SRC=~/.screenrc
cp $SRC $SRC.$(whoami)-$(date +%s).bak

sed -i '/^\s*multiuser\b/d' $SRC
echo -e "\nmultiuser on" >> $SRC

( grep -q "^\s*#*\s*caption\b" $SRC && sed -i '0,/^\s*#*\s*caption\b/{s/\(^\s*#*\s*caption\b.*$\)/\1\ncaption always "%{kw}%-w%{wr}%n %t%{-}%+w" # format string to show all windows and highlight currently selected window/}' $SRC ) || echo -e '\ncaption always "%{kw}%-w%{wr}%n %t%{-}%+w" # format string to show all windows and highlight currently selected window' >> $SRC

( grep -q "^\s*#*\s*defscrollback\b" $SRC && sed -i '0,/^\s*#*\s*defscrollback\b/{s/\(^\s*#*\s*defscrollback\b.*$\)/\1\ndefscrollback 20000 # scrollback buffer of 20k lines/}' $SRC ) || echo -e '\ndefscrollback 20000 # scrollback buffer of 20k lines' >> $SRC

( grep -q "^\s*#*\s*termcapinfo\b" $SRC && sed -i '0,/^\s*#*\s*termcapinfo\b/{s/\(^\s*#*\s*termcapinfo\b.*$\)/\1\n# Make xterm scrolling work properly with screen.\ntermcapinfo xterm-256color|xterm-color|xterm|xterms|xs|rxvt ti@:te@/}' $SRC ) || echo -e '\n# Make xterm scrolling work properly with screen.\ntermcapinfo xterm-256color|xterm-color|xterm|xterms|xs|rxvt ti@:te@' >> $SRC

( grep -q "^\s*#*\s*altscreen\b" $SRC && sed -i '0,/^\s*#*\s*altscreen\b/{s/\(^\s*#*\s*altscreen\b.*$\)/\1\naltscreen on # preference towards clearing screen when vim, less, man, and so on are closed/}' $SRC ) || echo -e '\naltscreen on # preference towards clearing screen when vim, less, man, and so on are closed' >> $SRC
