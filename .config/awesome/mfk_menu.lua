module("mfk.menu")

Mfk_menu = {}

firefox = {"firefox", "/usr/bin/firefox", "/usr/share/pixmaps/firefox.png"}
chrome = {"chrome", "/usr/bin/google-chrome", "/usr/share/pixmaps/Chrome.xpm"}
pidgin = {"Pidgin","/usr/bin/pidgin","/usr/share/pixmaps/pidgin-menu.xpm"}
thunderbird = {"Thunderbird", "/usr/bin/thunderbird","/usr/share/pixmaps/thunderbird.xpm"}

Mfk_menu["quickhits"] = {
	  chrome
    , firefox
    , pidgin
    , thunderbird
}

Mfk_menu["Debian_Applications_Accessibility"] = {
	{"Xmag","xmag"},
}
Mfk_menu["Debian_Applications_Editors"] = {
	{"Emacs 23 (text)", "x-terminal-emulator -e ".."/usr/bin/emacs23 -nw"},
	{"Emacs 23 (X11)","/usr/bin/emacs23"},
	{"Emacs 24 (text)", "x-terminal-emulator -e ".."/usr/bin/emacs24 -nw"},
	{"Emacs 24 (X11)","/usr/bin/emacs24"},
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gnome -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"jove", "x-terminal-emulator -e ".."/usr/bin/jove"},
	{"LeafPad","/usr/bin/leafpad","/usr/share/pixmaps/leafpad.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"NEdit","nedit","/usr/share/pixmaps/Nedit.xpm"},
	{"Xedit","xedit"},
	{"xpad","/usr/bin/xpad","/usr/share/pixmaps/xpad.xpm"},
}
Mfk_menu["Debian_Applications_File_Management"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"gmrun","/usr/bin/gmrun"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
	{"PCManFM","/usr/bin/pcmanfm"},
	{"Synapse","synapse"},
}
Mfk_menu["Debian_Applications_Graphics"] = {
	{"dotty","/usr/bin/dotty"},
	{"ImageMagick","/usr/bin/display.im6 logo:","/usr/share/pixmaps/display.im6.xpm"},
	{"lefty","/usr/bin/lefty"},
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"mtPaint","/usr/bin/mtpaint"},
	{"X Window Snapshot","xwd | xwud"},
}
Mfk_menu["Debian_Applications_Network_Communication"] = {
	{"heirloom-mailx", "x-terminal-emulator -e ".."/usr/bin/heirloom-mailx"},
	{"mcabber", "x-terminal-emulator -e ".."/usr/bin/mcabber"},
	{"Mutt", "x-terminal-emulator -e ".."/usr/bin/mutt","/usr/share/pixmaps/mutt.xpm"},
    pidgin,
	{"Remmina","/usr/bin/remmina"},
	{"Sylpheed","/usr/bin/sylpheed","/usr/share/pixmaps/sylpheed-debian.xpm"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
    thunderbid,
	{"Xbiff","xbiff"},
}
Mfk_menu["Debian_Applications_Network_File_Transfer"] = {
	{"ncftp", "x-terminal-emulator -e ".."/usr/bin/ncftp3"},
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Mfk_menu["Debian_Applications_Network_Monitoring"] = {
	{"IPTraf", "x-terminal-emulator -e ".."/usr/bin/su-to-root -c /usr/sbin/iptraf"},
}
Mfk_menu["Debian_Applications_Network_Web_Browsing"] = {
    chrome,
    firefox,
	{"Lynx-cur", "x-terminal-emulator -e ".."lynx"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Mfk_menu["Debian_Applications_Network"] = {
	{ "Communication", Mfk_menu["Debian_Applications_Network_Communication"] },
	{ "File Transfer", Mfk_menu["Debian_Applications_Network_File_Transfer"] },
	{ "Monitoring", Mfk_menu["Debian_Applications_Network_Monitoring"] },
	{ "Web Browsing", Mfk_menu["Debian_Applications_Network_Web_Browsing"] },
}
Mfk_menu["Debian_Applications_Office"] = {
	{"AbiWord Word Processor","/usr/bin/abiword","/usr/share/pixmaps/abiword.xpm"},
	{"gnumeric","/usr/bin/gnumeric","/usr/share/pixmaps/gnome-gnumeric.xpm"},
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
}
Mfk_menu["Debian_Applications_Science_Biology"] = {
	{"ClustalW", "x-terminal-emulator -e ".."/usr/bin/clustalw"},
}
Mfk_menu["Debian_Applications_Science_Chemistry"] = {
	{"PyMOL","/usr/bin/pymol","/usr/share/pixmaps/pymol.xpm"},
}
Mfk_menu["Debian_Applications_Science_Data_Analysis"] = {
	{"GNU R", "x-terminal-emulator -e ".."/usr/bin/R"},
}
Mfk_menu["Debian_Applications_Science_Engineering"] = {
	{"Dia","/usr/bin/dia","/usr/share/pixmaps/dia_menu.xpm"},
}
Mfk_menu["Debian_Applications_Science_Mathematics"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"galculator","/usr/bin/galculator","/usr/share/pixmaps/galculator.xpm"},
	{"Gnuplot", "x-terminal-emulator -e ".."/usr/bin/gnuplot"},
	{"Grace","/usr/bin/xmgrace","/usr/share/pixmaps/grace-menu.xpm"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Octave", "x-terminal-emulator -e ".."/usr/bin/octave"},
	{"Xcalc","xcalc"},
}
Mfk_menu["Debian_Applications_Science"] = {
	{ "Biology", Mfk_menu["Debian_Applications_Science_Biology"] },
	{ "Chemistry", Mfk_menu["Debian_Applications_Science_Chemistry"] },
	{ "Data Analysis", Mfk_menu["Debian_Applications_Science_Data_Analysis"] },
	{ "Engineering", Mfk_menu["Debian_Applications_Science_Engineering"] },
	{ "Mathematics", Mfk_menu["Debian_Applications_Science_Mathematics"] },
}
Mfk_menu["Debian_Applications_Shells"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"tcsh", "x-terminal-emulator -e ".."/bin/tcsh"},
	{"Zsh", "x-terminal-emulator -e ".."/bin/zsh5"},
}
Mfk_menu["Debian_Applications_Sound"] = {
	{"Audacious","/usr/bin/audacious"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"Rhythmbox","/usr/bin/rhythmbox","/usr/share/pixmaps/rhythmbox-small.xpm"},
}
Mfk_menu["Debian_Applications_System_Administration"] = {
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center",},
	{"GNOME Network Tool","/usr/bin/gnome-nettool","/usr/share/pixmaps/gnome-nettool.xpm"},
	{"LXAppearance","/usr/bin/lxappearance"},
	{"Network Admin","/usr/bin/network-admin","/usr/share/gnome-system-tools/pixmaps/network.xpm"},
	{"Openbox Configuration Manager","/usr/bin/obconf","/usr/share/pixmaps/obconf.xpm"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"Reportbug", "x-terminal-emulator -e ".."/usr/bin/reportbug --exit-prompt"},
	{"Reportbug (GTK+)","/usr/bin/reportbug --exit-prompt --ui gtk2"},
	{"Services Admin","/usr/bin/services-admin","/usr/share/gnome-system-tools/pixmaps/services.xpm"},
	{"Shares Admin","/usr/bin/shares-admin","/usr/share/gnome-system-tools/pixmaps/shares.xpm"},
	{"System Information","/usr/bin/hardinfo","/usr/share/pixmaps/hardinfo.xpm"},
	{"TeXconfig", "x-terminal-emulator -e ".."/usr/bin/texconfig"},
	{"Time Admin","/usr/bin/time-admin","/usr/share/gnome-system-tools/pixmaps/time.xpm"},
	{"User accounts Admin","/usr/bin/users-admin","/usr/share/gnome-system-tools/pixmaps/users.xpm"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Mfk_menu["Debian_Applications_System_Hardware"] = {
	{"ARandR","arandr"},
	{"Xvidtune","xvidtune"},
}
Mfk_menu["Debian_Applications_System_Language_Environment"] = {
	{"Input Method Configuration", "x-terminal-emulator -e ".."/usr/bin/im-config"},
}
Mfk_menu["Debian_Applications_System_Monitoring"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"LXRandR","/usr/bin/lxrandr"},
	{"LXTask","/usr/bin/lxtask"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Mfk_menu["Debian_Applications_System_Package_Management"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
	{"Synaptic Package Manager","x-terminal-emulator -e synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Mfk_menu["Debian_Applications_System_Security"] = {
	{"light-locker-settings","light-locker-settings"},
	{"Seahorse","/usr/bin/seahorse","/usr/share/pixmaps/seahorse.xpm"},
}
Mfk_menu["Debian_Applications_System"] = {
	{ "Administration", Mfk_menu["Debian_Applications_System_Administration"] },
	{ "Hardware", Mfk_menu["Debian_Applications_System_Hardware"] },
	{ "Language Environment", Mfk_menu["Debian_Applications_System_Language_Environment"] },
	{ "Monitoring", Mfk_menu["Debian_Applications_System_Monitoring"] },
	{ "Package Management", Mfk_menu["Debian_Applications_System_Package_Management"] },
	{ "Security", Mfk_menu["Debian_Applications_System_Security"] },
}
Mfk_menu["Debian_Applications_Terminal_Emulators"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"LXTerminal","/usr/bin/lxterminal","/usr/share/pixmaps/lxterminal.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Mfk_menu["Debian_Applications_Text"] = {
	{"Character map","/usr/bin/gucharmap"},
	{"HTMLDoc","/usr/bin/htmldoc"},
}
Mfk_menu["Debian_Applications_Video"] = {
	{"GNOME MPlayer","gnome-mplayer","/usr/share/pixmaps/gnome-mplayer.xpm"},
	{"guvcview","/usr/bin/guvcview"},
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
}
Mfk_menu["Debian_Applications_Viewers"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"GV","/usr/bin/gv","/usr/share/pixmaps/mini-gv.xpm"},
	{"Shotwell","/usr/bin/shotwell"},
	{"Wordview","/usr/bin/wordview"},
	{"Xditview","xditview"},
	{"XDvi","/usr/bin/xdvi"},
}
Mfk_menu["Debian_Help"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"TeXdoctk","/usr/bin/texdoctk"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Mfk_menu["Programs"] = {
	{ "Accessibility", Mfk_menu["Debian_Applications_Accessibility"] },
	{ "Editors", Mfk_menu["Debian_Applications_Editors"] },
	{ "File Management", Mfk_menu["Debian_Applications_File_Management"] },
	{ "Graphics", Mfk_menu["Debian_Applications_Graphics"] },
	{ "Network", Mfk_menu["Debian_Applications_Network"] },
	{ "Office", Mfk_menu["Debian_Applications_Office"] },
	{ "Science", Mfk_menu["Debian_Applications_Science"] },
	{ "Shells", Mfk_menu["Debian_Applications_Shells"] },
	{ "Sound", Mfk_menu["Debian_Applications_Sound"] },
	{ "System", Mfk_menu["Debian_Applications_System"] },
	{ "Terminal Emulators", Mfk_menu["Debian_Applications_Terminal_Emulators"] },
	{ "Text", Mfk_menu["Debian_Applications_Text"] },
	{ "Video", Mfk_menu["Debian_Applications_Video"] },
	{ "Viewers", Mfk_menu["Debian_Applications_Viewers"] },
	{ "Help", Mfk_menu["Debian_Help"] },
}
