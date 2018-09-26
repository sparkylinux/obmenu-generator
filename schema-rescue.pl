#!/usr/bin/perl

# obmenu-generator - schema file
# Slighlty modified for SparkyLinux by pavroo <pavroo@onet.eu> 2015/Nov/12
# Last update 2018/09/26

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    #          COMMAND                 LABEL              ICON
    ### Rescue tools menu ###
    {sep => 'Rescue Tools'},

    #          NAME            LABEL                ICON
    {beg => ['Backup', 'luckybackup']},
	{item => ['remsu sparky-xterm-exec clonezilla',        'Clonezilla',      'applications-development']},
	{item => ['/usr/share/ddrescue-gui/DDRescue-GUI.py',        'DDRescue GUI',      'ddrescue-gui']},
	{item => ['grsync',        'Grsync',      'grsync']},
	{item => ['luckybackup',        'luckyBackup',      'luckybackup']},
	{item => ['remsu sparky-xterm-exec redobackup',        'Redo Backup',      '/usr/share/pixmaps/redobackup.png']},
    {end => undef},

    {beg => ['Bootloader', '/usr/share/boot-sav/x-boot-repair.png']},
	{item => ['remsu sparky-xterm-exec boot-repair',        'Boot Repair',      '/usr/share/boot-sav/x-boot-repair.png']},
    {end => undef},

    {beg => ['Chroot', 'utilities-terminal']},
	{item => ['remsu sparky-chrooter',        'Chrooter',      'utilities-terminal']},
    {end => undef},
    
    {beg => ['Disk', 'gparted']},
	{item => ['remsu sparky-xterm-exec cfdisk',        'Cfdisk',      'drive-harddisk']},
	{item => ['remsu sparky-xterm-exec disk-manager',        'Disk Manager',      'disk-manager']},
	{item => ['baobab',        'Disk Usage Analyser',      'baobab']},
	{item => ['gparted',        'GParted',      'gparted']},
	{item => ['remsu sparky-xterm-exec gsmartcontrol',        'GSmartControl',      'gsmartcontrol']},
	{item => ['remsu sparky-xterm-exec system-config-lvm',        'Logical Volume Management',      '/usr/share/system-config-lvm/pixmaps/lv_icon.png']},
	{item => ['remsu sparky-xterm-exec testdisk',        'TestDisk',      'utilities-terminal']},
    {end => undef},

    {beg => ['Encryption', 'truecrypt']},
	{item => ['veracrypt',        'VeraCrypt',      '/usr/share/pixmaps/veracrypt.xpm']},
	{item => ['zuluCrypt-gui',        'zuluCrypt GUI',      '/usr/share/pixmaps/zuluCrypt.xpm']},
	{item => ['zuluMount-gui',        'zuluMount GUI',      '/usr/share/pixmaps/zuluMount.xpm']},
    {end => undef},

    {beg => ['Files', 'folder']},
	{item => ['sparky-eraser',        'Eraser',      'user-trash-full']},
	{item => ['sparky-fileopen',        'Files',      'folder']},
	{item => ['sparky-xterm mc',        'Midnight Commander',      'MidnightCommander']},
	{item => ['remsu sparky-xterm-exec photorec',        'PhotoRec',      'terminal']},
	{item => ['tuxcmd',        'TUX Commander',      'tuxcmd']},
	{item => ['xarchiver',        'Xarchiver',      'xarchiver']},
    {sep => undef},
	{item => ['remsu sparky-eraser',        'Root Eraser',      'user-trash-full']},
	{item => ['remsu sparky-fileopen',        'Root Files',      'folder-red']},
	{item => ['remsu sparky-xterm-exec mc',        'Root Midnight Commander',      'folder-red']},
	{item => ['remsu sparky-xterm-exec tuxcmd',        'Root TUX Commander',      'tuxcmd']},
    {end => undef},

    {beg => ['Malware', 'gnibbles']},
	{item => ['clamtk',        'ClamTK',      'clamtk']},
    {end => undef},

    {beg => ['Monitoring', 'htop']},
	{item => ['sparky-xterm htop',        'htop',      'htop']},
	{item => ['sparky-xterm nmon',        'nmon',      'htop']},
	{item => ['lxtask',        'Task Manager',      'utilities-system-monitor']},
	{item => ['sparky-xterm top',        'top',      'htop']},
    {end => undef},

    {beg => ['Passwords MS Windows', 'security-medium']},
	{item => ['ophcrack',        'ophcrack',      '/usr/share/pixmaps/ophcrack.xpm']},
    {end => undef},

    {beg => ['Remote Desktop', 'folder-network']},
	{item => ['gigolo',        'Gigolo',      'gtk-network']},
	{item => ['grdesktop',        'rdesktop GUI',      '/usr/share/pixmaps/grdesktop.png']},
	{item => ['remmina',        'Remmina',      'remmina']},
	{item => ['/opt/sparky-teamviewer/teamviewer-launcher',        'TeamViewer',      'teamviewer']},
    {end => undef},

    {beg => ['Terminal Emulators', 'terminal']},
	{item => ['lxterminal',        'Lxterminal',      'lxterminal']},
	{item => ['uxterm',        'UXTerm',      'terminal']},
	{item => ['xterm',        'XTerm',      'terminal']},
    {sep => undef},
	{item => ['remsu sparky-xterm-exec lxterminal',        'Root Lxterminal',      'gksu-root-terminal']},
	{item => ['remsu sparky-xterm-exec uxterm',        'Root UXterm',      'gksu-root-terminal']},
	{item => ['remsu sparky-xterm-exec xterm',        'Root Xterm',      'gksu-root-terminal']},
    {end => undef},
    
    ### Help menu ###
    {sep => 'Help'},
    {beg => ['Quick Help', 'help']},
	{beg => ['Backup Help', 'luckybackup']},
	    {item => ['x-www-browser http://clonezilla.org/fine-print-live-doc.php?path=./clonezilla-live/doc/01_Save_disk_image/05-start-clonezilla-or-cmd.doc#05-start-clonezilla-or-cmd.doc',        'Clonezilla (OnLine)',      'help-about']},
	    {item => ['x-www-browser /usr/share/doc/gddrescue/html/index.html',        'DDRescue',      'help-about']},
	    {item => ['sparky-xterm man fsarchiver',        'FSArchiver',      'help-about']},
	    {item => ['sparky-xterm man grsync',        'Grsync',      'help-about']},
	    {item => ['x-www-browser /usr/share/doc/luckybackup/manual/index.html',        'luckyBackup',      'help-about']},
	    {item => ['sparky-xterm man partclone',        'Partclone',      'help-about']},
	    {item => ['sparky-xterm man partimage',        'Partimage',      'help-about']},
	    {item => ['sparky-xterm man partimaged',        'Partimage Server',      'help-about']},
        {end => undef},

	{beg => ['Bootloader Help', '/usr/share/boot-sav/x-boot-repair.png']},
	    {item => ['sparky-xterm man boot-repair',        'Boot Repair',      'help-about']},
        {end => undef},

	{beg => ['Chroot Help', 'utilities-terminal']},
	    {item => ['sparky-xterm man chroot',        'Chroot',      'help-about']},
	    {item => ['/opt/sparky/sparky-chrooter-help',        'Chrooter',      'help-about']},
        {end => undef},

	{beg => ['Disk Help', 'gparted']},
	    {item => ['sparky-xterm man baobab',        'Baobab',      'help-about']},
	    {item => ['sparky-xterm man cfdisk',        'Cfdisk',      'help-about']},
	    {item => ['sparky-xterm man disk-manager',        'Disk Manager',      'help-about']},
	    {item => ['sparky-xterm man disktype',        'Disktype',      'help-about']},
	    {item => ['sparky-xterm man fdisk',        'Fdisk',      'help-about']},
	    {item => ['sparky-xterm man gdisk',        'Gdisk',      'help-about']},
	    {item => ['sparky-xterm man gparted',        'GParted',      'help-about']},
	    {item => ['sparky-xterm man gsmartcontrol',        'GSmartControl',      'help-about']},
	    {item => ['sparky-xterm man lvm',        'LVM2',      'help-about']},
	    {item => ['sparky-xterm man mdadm',        'mdadm',      'help-about']},
	    {item => ['sparky-xterm man parted',        'Parted',      'help-about']},
	    {item => ['sparky-xterm man smartctl',        'Smartmontools',      'help-about']},
	    {item => ['sparky-xterm man smart-notifier',        'Smart-Notifier',      'help-about']},
	    {item => ['sparky-xterm man system-config-lvm',        'System Config LVM',      'help-about']},
	    {item => ['sparky-xterm man testdisk',        'TestDisk',      'help-about']},
        {end => undef},

	{beg => ['Encryption Help', 'truecrypt']},
	    {item => ['sparky-xterm man cryptmount',        'Cryptmount',      'help-about']},
	    {item => ['sparky-xterm man cryptsetup',        'Cryptsetup',      'help-about']},
	    {item => ['sparky-xterm man ecryptfs-manager',        'eCryptfs Manager',      'help-about']},
	    {item => ['sparky-xterm man tcplay',        'Tcplay',      'help-about']},
	    {item => ['x-www-browser file:///usr/share/veracrypt/doc/HTML/Documentation.html',        'VeraCrypt',      'help-about']},
	    {item => ['qpdfview /usr/share/zuluCrypt/zuluCrypt.pdf',        'zuluCrypt',      'help-about']},
	    {item => ['sparky-xterm man zuluMount-gui',        'zuluMount',      'help-about']},
        {end => undef},

	{beg => ['Files Help', 'folder']},
	    {item => ['sparky-xterm man photorec',        'PhotoRec',      'help-about']},
	    {item => ['sparky-xterm man shred',        'Shred',      'help-about']},
	    {item => ['sparky-xterm man wipe',        'Wipe',      'help-about']},
        {end => undef},

	{beg => ['Malware Help', 'gnibbles']},
	    {item => ['sparky-xterm man chkrootkit',        'Chkrootkit',      'help-about']},
	    {item => ['sparky-xterm man clamscan',        'ClamAV',      'help-about']},
	    {item => ['sparky-xterm man clamtk',        'ClamTK',      'help-about']},
	    {item => ['sparky-xterm man rkhunter',        'Rkhunter',      'help-about']},
        {end => undef},

	{beg => ['Monitoring Help', 'htop']},
	    {item => ['sparky-xterm man htop',        'htop',      'help-about']},
	    {item => ['sparky-xterm man inxi',        'inxi',      'help-about']},
	    {item => ['sparky-xterm man nmon',        'nmon',      'help-about']},
	    {item => ['sparky-xterm man sensors',        'sensors',      'help-about']},
	    {item => ['sparky-xterm man lxtask',        'Task Manager',      'help-about']},
	    {item => ['sparky-xterm man top',        'top',      'help-about']},
        {end => undef},

	{beg => ['Network Help', 'preferences-system-network']},
	    {item => ['sparky-xterm man smbclient',        'Samba Client',      'help-about']},
        {end => undef},

	{beg => ['Package Managers Help', 'package-manager-icon']},
	    {item => ['sparky-xterm man apt',        'APT',      'help-about']},
	    {item => ['sparky-xterm man rpm',        'RPM',      'help-about']},
	    {item => ['sparky-xterm man yum',        'YUM',      'help-about']},
        {end => undef},

	{beg => ['Passwords MS Windows Help', 'security-medium']},
	    {item => ['sparky-xterm man ophcrack',        'ophcrack',      'help-about']},
        {end => undef},

	{beg => ['Remote Desktop Help', 'folder-network']},
	    {item => ['sparky-xterm man drblsrv',        'DRBL',      'help-about']},
	    {item => ['x-www-browser http://www.uvena.de/gigolo/help.html',        'Gigolo (OnLine)',      'help-about']},
	    {item => ['sparky-xterm man rdesktop',        'rdesktop',      'help-about']},
	    {item => ['x-www-browser /usr/share/doc/grdesktop/FAQ.html',        'rdesktop GUI',      'help-about']},
	    {item => ['sparky-xterm man remmina',        'Remmina',      'help-about']},
	    {item => ['x-www-browser https://www.teamviewer.com/en/help/firststeps.aspx',        'TeamViewer (OnLine)',      'help-about']},
        {end => undef},

    {end => undef},

    ### Applications menu ###
    {sep => 'Applications'},
    {beg => ['Accessories', 'gnome-menu']},
	{item => ['florence',        'Florence Virtual Keyboard',      '/usr/share/pixmaps/florence.svg']},
	{item => ['gpicview',        'Image Viewer',      'gpicview']},
	{item => ['leafpad',        'Leafpad',      'leafpad']},
	{item => ['gscreenshot',        'Screenshot',      'applets-screenshooter']},
    {end => undef},

    {beg => ['Multimedia', 'configure']},
	{item => ['pavucontrol',        'PulseAudio Volume Control',      'multimedia-volume-control']},
    {end => undef},

    {beg => ['Network', 'applications-internet']},
	{item => ['hexchat',        'HexChat IRC client',      'hexchat']},
	{item => ['x-www-browser',        'Web browser',      'web-browser']},
	{item => ['thunar network:///',        'Windows Network',       'folder-remote']},
    {end => undef},

    {beg => ['Office', 'applications-office']},
	{item => ['qpdfview',        'qpdfview',      'qpdfview']},
    {end => undef},

    {beg => ['Settings', 'applications-accessories']},
	{item => ['gufw',        'Firewall',      'gufw']},
	{item => ['lxinput',        'Keyboard and Mouse',      'input-keyboard']},
	{item => ['lxrandr',        'Monitor Settings',      'preferences-desktop-display']},
	{item => ['nm-connection-editor',        'Network Connections',      'preferences-system-network']},
	{item => ['obconf',        'ObConf',      'obconf']},
	{item => ['system-config-printer',        'Print Settings',      'printer']},
	{item => ['xscreensaver-demo',        'Screensaver',      'xscreensaver']},
	{item => ['tint2conf',        'Tint2 Config',      'tint2conf']},
	{item => ['nitrogen',        'Wallpaper',      'nitrogen']},
    {end => undef},

    {beg => ['System', 'applications-system']},
	{item => ['sparky-about',        'About SparkyLinux',      '/usr/share/icons/sparky/about/sparky48.png']},
	{item => ['remsu custom-iso-builder',        'Custom ISO Builder',      'drive-cdrom']},
	{item => ['remsu deb-package-builder',        'DEB Package Builder',      'gnome-mime-application-x-deb']},
	{item => ['remsu sparky-live-usb-creator',        'Live USB Disk Creator',      'drive-removable-media-usb-pendrive']},
	{item => ['synaptic-pkexec',        'Synaptic',      'synaptic']},
	{item => ['gnome-system-log-pkexec',        'System Log',      'logview']},
	{item => ['hardinfo',        'System Profiler and Benchmark',      '/usr/share/hardinfo/pixmaps/logo.png']},
	{item => ['systemadm',        'Systemd Manager',      'applications-system']},
	{item => ['remsu sparky-usb-formatter',        'USB Disk Formatter',      'drive-removable-media-usb-pendrive']},
	{item => ['xkill',        'Xkill',      'xkill']},
    {end => undef},

    ## Custom advanced settings
    {sep => undef},
    {beg => ['Advanced Settings', 'applications-engineering']},

      # Configuration files
      #{item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-generic']},
      {item => ["obmenu-panel-edit", 'Panel', 'text-x-generic']},

      # obmenu-generator category
      {beg => ['Obmenu-Generator', 'accessories-text-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},

        {sep  => undef},
        {item => ['obmenu-generator -s -c',    'Generate a static menu',             'accessories-text-editor']},
        {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons',  'accessories-text-editor']},
        {sep  => undef},
        {item => ['obmenu-generator -p',       'Generate a dynamic menu',            'accessories-text-editor']},
        {item => ['obmenu-generator -p -i',    'Generate a dynamic menu with icons', 'accessories-text-editor']},
        {sep  => undef},

        {item => ['obmenu-generator -d', 'Refresh Icon Set', 'view-refresh']},
      {end => undef},

      # Openbox category
      {beg => ['Openbox', 'openbox']},
        {item => ['openbox --restart',               'Restart Openbox', 'openbox']},
        {item => ["$editor ~/.config/openbox/autostart.sh", 'Openbox Autostart.sh',   'text-x-generic']},
        {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
        {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-x-generic']},
      {end => undef},
    {end => undef},

    {sep => undef},

    ## The xscreensaver lock command
    {item => ['xscreensaver-command -lock', 'Lock', 'system-lock-screen']},

    ## This option uses the default Openbox's action "Exit"
    #{exit => ['Exit', 'application-exit']},
    {item => ['wm-logout', 'Exit', 'exit']},

    ## This uses the 'oblogout' menu
    # {item => ['oblogout', 'Exit', 'exit']},
]
