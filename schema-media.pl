#!/usr/bin/perl

# obmenu-generator - schema file
# Slighlty modified for SparkyLinux by pavroo <pavroo@onet.eu> 2015/Nov/12
# Last update 2017/12/07

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
    {item => ['xdg-open .',       'File Manager', 'system-file-manager']},
    {item => ['x-terminal-emulator',             'Terminal',          'terminal']},
    {item => ['x-www-browser',  'Web Browser',       'web-browser']},
    {item => ['gexec',             'Run command',       'system-run']},

    {sep => 'Categories'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {beg => ['Audio', 'applications-multimedia']},
        {beg => ['Audio Players', 'multimedia-audio-player']},
            {item => ['deadbeef',  'DeadBeeF',  'deadbeef']},
            {item => ['radiotray',  'Radio Tray',  'radiotray']},
        {end => undef},

        {beg => ['Connection', 'audio-equalizer']},
            {item => ['gjackclock',  'G. JACK Clock',  'gjackclock']},
            {item => ['gjacktransport',  'G. JACK Transport',  'gjacktransport']},
            {item => ['patchage',  'Patchage',  'patchage']},
            {item => ['qjackctl',  'QjackCtl',  'qjackctl']},
        {end => undef},

        {beg => ['Effects', 'audio-equalizer']},
            {item => ['zita-at1',  'AT1',  'zita-at1']},
            {item => ['calfjackhost',  'Calf Plugin Pack for JACK',  'calf']},
            {item => ['guitarix',  'guitarix',  'gx_head']},
            {item => ['/usr/share/jamin/jamin-wrapper',  'JAMin',  '/usr/share/icons/jamin.svg']},
            {item => ['projectM-jack',  'projectM Jack Audio Visualization',  'prjm16-transparent']},
            {item => ['projectM-pulseaudio',  'projectM PulseAudio Visualization',  'prjm16-transparent']},
            {item => ['rakarrack',  'Rakarrack',  'icono_rakarrack_128x128']},
            {item => ['zita-bls1',  'Zita-bls1',  'zita-bls1']},
            {item => ['zita-mu1',  'Zita-mu1',  'zita-mu1']},
        {end => undef},

        {beg => ['MIDI Tools', 'applications-multimedia']},
            {item => ['gmidimonitor --alsa',  'Gmidimonitor (with ALSA support)',  'gmidimonitor_32x32']},
            {item => ['gmidimonitor --jack',  'Gmidimonitor (with JACK support)',  'gmidimonitor_32x32']},
            {item => ['jack-keyboard',  'JACK Keyboard',  'jack-keyboard']},
            {item => ['petri-foo',  'Petri-Foo',  'petri-foo']},
            {item => ['qmidinet',  'QmidiNet',  'qmidinet']},
            {item => ['qmidiroute',  'Qmidiroute',  'qmidiroute_32x32']},
            {item => ['vkeybd',  'Virtual MIDI Keyboard',  'vkeybd']},
        {end => undef},

        {beg => ['Mixers', 'applications-audio']},
            {item => ['echomixer',  'Echomixer',  'hdspmixer']},
            {item => ['envy24control',  'Envy24 control',  'hdspmixer']},
            {item => ['ffado-mixer',  'FFADO Mixer',  'hdspmixer']},
            {item => ['hdajackretask',  'HDAJackRetask',  'hdspmixer']},
            {item => ['hdspconf',  'HDSPConf',  'hdspmixer']},
            {item => ['hdspmixer',  'HDSPMixer',  'hdspmixer']},
            {item => ['jack_mixer',  'Jack Mixer',  'jack_mixer']},
            {item => ['mudita24',  'Mudita24',  'mudita24']},
            {item => ['pavucontrol',  'PulseAudio Volume Control',  'multimedia-volume-control']},
            {item => ['qasconfig',  'QasConfig',  'qasconfig']},
            {item => ['qashctl',  'QasHctl',  'qashctl']},
            {item => ['qasmixer',  'QasMixer',  'qasmixer']},
            {item => ['rmedigicontrol',  'Rmedigicontrol',  'hdspmixer']},
        {end => undef},

        {beg => ['Sequencing', 'applications-multimedia']},
            {item => ['composite-gui',  'Composite',  'composite32x32']},
            {item => ['hydrogen',  'Hydrogen',  'h2-icon']},
            {item => ['lmms',  'LMMS',  'lmms']},
            {item => ['qtractor',  'Qtractor',  'qtractor']},
            {item => ['rosegarden',  'Rosegarden',  'rosegarden']},
            {item => ['slgui',  'SooperLooper',  'sooperlooper']},
        {end => undef},

        {beg => ['SoftSynths', 'audio-editor']},
            {item => ['aeolus',  'Aeolus',  'audio-x-generic']},
            {item => ['foo-yc20',  'Foo YC20',  '/usr/share/foo-yc20/graphics/icon.png']},
            {item => ['phasex',  'PHASEX',  'phasex']},
            {item => ['/usr/lib/puredata/tcl/pd-gui.tcl',  'Pure Data',  'puredata']},
            {item => ['qsynth',  'Qsynth',  'qsynth']},
            {item => ['samplv1_jack',  'samplv1',  'samplv1']},
            {item => ['yoshimi',  'Yoshimi',  'yoshimi']},
        {end => undef},

        {beg => ['Tools', 'multimedia-audio-player']},
            {item => ['ardour5',  'Ardour5',  'ardour']},
            {item => ['audacity',  'Audacity',  'audacity']},
            {item => ['tagtool',  'Audio Tag Tool',  'TagTool']},
            {item => ['bitmeter',  'Bitmeter',  'bitmeter']},
            {item => ['idjc',  'Internet DJ Console',  'idjc']},
            {item => ['remsu sparky-codecs',  'Install multimedia codecs',  'gnome-audio']},
            {item => ['jaaa -A -d hw:0',  'Jaaa (with ALSA support)',  'jaaa']},
            {item => ['jaaa -J',  'Jaaa (with JACK support)',  'jaaa']},
            {item => ['timemachine',  'JACK Timemachine',  '/usr/share/timemachine/pixmaps/timemachine-icon.png']},
            {item => ['jmeters -t din -c 2 L R',  'Jmeters',  'jmeters_32x32']},
            {item => ['jnoisemeter',  'Jnoisemeter',  'jnoisemeter_32x32']},
            {item => ['meterbridge -t vu alsa_pcm:playback_1 alsa_pcm:playback_2',  'Meterbridge',  'meterbridge32x32']},
            {item => ['mixxx',  'Mixxx',  'mixxx-icon']},
            {item => ['qjackrcd',  'QJackRcd',  'qjackrcd']},
            {item => ['rosegarden',  'Rosegarden',  'rosegarden']},
            {item => ['snd.gtk-jack',  'Snd',  'snd']},
            {item => ['soundconverter',  'Sound Converter',  'soundconverter']},
            {item => ['sound-juicer',  'Sound Juicer',  'sound-juicer']},
            {item => ['sweep',  'Sweep',  'sweep']},
            {item => ['tuxguitar',  'tuxguitar',  'tuxguitar']},
        {end => undef},

        {beg => ['Tunning', 'audio-equalizer']},
            {item => ['gxtuner',  'gxtuner',  'gxtuner']},
            {item => ['lingot',  'Lingot',  '/usr/share/pixmaps/lingot/lingot-icon.svg']},
        {end => undef},

    {end => undef},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},
    {beg => ['Video', 'multimedia-video-player']},
        {beg => ['Camera', 'shotwell']}, 
            {item => ['camorama',  'Camorama Webcam Viewer',  'camorama']},
        {end => undef},

        {beg => ['Recording CD/DVD', 'brasero']}, 
            {item => ['brasero',  'Brasero',  'brasero']},
        {end => undef},

        {beg => ['Subtitles', 'accessories-text-editor']}, 
            {item => ['subtitleeditor',  'Subtitle Editor',  'subtitleeditor']},
        {end => undef},

        {beg => ['Tools', 'multimedia-video-player']},
            {item => ['avidemux',  'Avidemux (Qt)',  'avidemux']},
            {item => ['blender',  'Blender',  'blender']},
            {item => ['ogmrip',  'DVD Encoder OGMRip',  'ogmrip']},
            {item => ['dvdrip',  'dvd::rip',  'dvdrip']},
            {item => ['dvdstyler',  'DVD Styler',  'dvdstyler']},
            {item => ['kdenlive',  'Kdenlive',  'kdenlive']},
            {item => ['lives',  'LiVES',  'lives']},
            {item => ['openshot',  'OpenShot Video Editor',  'openshot']},
            {item => ['gtk-recordmydesktop',  'RecordMyDesktop',  'gtk-recordmydesktop']},
            {item => ['stopmotion',  'Stopmotion',  'stopmotion']},
            {item => ['transmageddon',  'Transmageddon Video Transkoder',  'transmageddon']},
            {item => ['videocut',  'VideoCut',  'videocut']},
            {item => ['winff',  'WinFF',  'winff']},
            {item => ['xjadeo',  'Xjadeo',  'qjadeo']},
        {end => undef},

        {beg => ['Video Players', 'multimedia-video-player']}, 
            {item => ['vlc',  'VLC',  'vlc']},
            {item => ['xine',  'xine',  'xine']},
            {item => ['xjadeo',  'Xjadeo',  'qjadeo']},
        {end => undef},
    {end => undef},

    {beg => ['Wine', 'wine']},
        {item => ['winecfg',  'Configure Wine',  'wine-winecfg']},
        {item => ['wine uninstaller',  'Uninstal Wine Software',  'wine-uninstaller']},
        {item => ['sparky-wine',  'Wine Wrapper',  'wine']},
    {end => undef},

    #                  LABEL          ICON
    #{beg => ['My category',  'cat-icon']},
    #          ... some items ...
    #{end => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {beg => ['Advanced Settings', 'applications-engineering']},

      # Configuration files
      #{item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-generic']},
      #{item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Panel', 'text-x-generic']},
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
        {item => ["$editor ~/.config/openbox/autostart.sh", 'Openbox Autostart',   'text-x-generic']},
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
