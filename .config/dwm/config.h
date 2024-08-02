/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "FiraCodeNerdFont-Bold:size=12" };
static const char dmenufont[]       = "FiraCodeNerdFont-Bold:size=12";
static const char col_gray1[]       = "#282c34";
static const char col_gray2[]       = "#282c34";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#52565C";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { " ", " ", " ", " ", " ", " ", " ", " ", " " };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "mpv",      NULL,       NULL,       0,            1,           -1 },
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG)                                                                                               \
       &((Keychord){1, {{MODKEY, KEY}},                                        view,           {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ControlMask, KEY}},                            toggleview,     {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ShiftMask, KEY}},                              tag,            {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ControlMask|ShiftMask, KEY}},                  toggletag,      {.ui = 1 << TAG} }),

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/zsh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *roficmd[]  = { "rofi", "-show", "drun", NULL };

static const char *increaseVol[]    = { "sh", ".config/dunst/scripts/vol.sh", "3%+", NULL };
static const char *decreaseVol[]    = { "sh", ".config/dunst/scripts/vol.sh", "3%-", NULL };
static const char *muteVol[]        = { "wpctl", "set-mute", "@DEFAULT_SINK@", "toggle", NULL };

static const char *increaseLight[]  = { "brightnessctl", "set", "5%+", NULL };
static const char *decreaseLight[]  = { "brightnessctl", "set", "5%-", NULL };

static const char *launchBrowser[]  = { "brave-browser", NULL };
static const char *launchEditor[]   = { "emacsclient","-c", "-a", "emacs", NULL };
static const char *takeScreenShot[] = { "flameshot","launcher", NULL };
static const char *launchSpotify[]  = { "spotify", NULL };
static const char *launchTorrent[]  = { "transmission-gtk", NULL };

static const char *findDocs[]       = { "bash", ".local/bin/scripts/docs.sh", NULL };
static const char *killProccess[]   = { "bash", ".local/bin/scripts/killproccess.sh", NULL };
static const char *scanWifi[]       = { "bash", ".local/bin/scripts/wifi.sh", NULL };
static const char *surfWeb[]        = { "bash", ".local/bin/scripts/surf.sh", NULL };
static const char *searchGithub[]   = { "bash", ".local/bin/scripts/github.sh", NULL };
static const char *powerPc[]        = { "bash", ".local/bin/scripts/power.sh", NULL };
static const char *showTv[]         = { "bash", ".local/bin/scripts/tv.sh", NULL };
static const char *toggleKeyboard[] = { "bash", ".local/bin/scripts/keyboard.sh", NULL };

static Keychord *keychords[] = {
       /* Keys        function        argument */
       &((Keychord){1, {{MODKEY, XK_p}},                           spawn,          {.v = dmenucmd } }),
       &((Keychord){1, {{MODKEY, XK_Return}},                      spawn,          {.v = termcmd } }),
       &((Keychord){1, {{MODKEY, XK_space}},                       spawn,          {.v = roficmd } }),
       &((Keychord){1, {{MODKEY, XK_q}},                           killclient,          {0} }),

       /* Launch Apps */
       &((Keychord){1, {{MODKEY, XK_b}},                           spawn,          {.v = launchBrowser } }),
       &((Keychord){1, {{MODKEY, XK_e}},                           spawn,          {.v = launchEditor } }),
       &((Keychord){1, {{MODKEY, XK_f}},                           spawn,          {.v = takeScreenShot } }),
       &((Keychord){1, {{MODKEY, XK_s}},                           spawn,          {.v = launchSpotify } }),
       &((Keychord){1, {{MODKEY, XK_t}},                           spawn,          {.v = launchTorrent } }),

       /* Volume */
       &((Keychord){1, {{0, XF86XK_AudioRaiseVolume}},             spawn,          {.v = increaseVol } }),
       &((Keychord){1, {{0, XF86XK_AudioLowerVolume}},             spawn,          {.v = decreaseVol } }),
       &((Keychord){1, {{0, XF86XK_AudioMute}},                    spawn,          {.v = muteVol } }),
  
       /* LIGHT */
       &((Keychord){1, {{0, XF86XK_MonBrightnessUp}},              spawn,          {.v = increaseLight } }),
       &((Keychord){1, {{0, XF86XK_MonBrightnessDown}},            spawn,          {.v = decreaseLight } }),

       /* Custom scripts */
       &((Keychord){2, {{MODKEY, XK_c}, {0, XK_d}},                spawn,          {.v = findDocs } }),
       &((Keychord){2, {{MODKEY, XK_c}, {0, XK_k}},                spawn,          {.v = killProccess } }),
       &((Keychord){2, {{MODKEY, XK_c}, {0, XK_w}},                spawn,          {.v = scanWifi } }),
       &((Keychord){2, {{MODKEY, XK_c}, {0, XK_s}},                spawn,          {.v = surfWeb } }),
       &((Keychord){2, {{MODKEY, XK_c}, {0, XK_g}},                spawn,          {.v = searchGithub } }),
       &((Keychord){2, {{MODKEY, XK_c}, {0, XK_p}},                spawn,          {.v = powerPc } }),
       &((Keychord){2, {{MODKEY, XK_c}, {0, XK_t}},                spawn,          {.v = showTv } }),
       &((Keychord){1, {{Mod1Mask|ShiftMask, XK_Return}},          spawn,          {.v = toggleKeyboard } }),

       &((Keychord){1, {{MODKEY|ShiftMask, XK_f}},                 fullscreen,     {0} }),
    /* &((Keychord){2, {{MODKEY, XK_e}, {MODKEY, XK_e}},                spawn,          {.v = termcmd } }),
       &((Keychord){1, {{MODKEY, XK_b}},                                togglebar,      {0} }),
       &((Keychord){1, {{MODKEY, XK_j}},                                focusstack,     {.i = +1 } }),
       &((Keychord){1, {{MODKEY, XK_k}},                                focusstack,     {.i = -1 } }),
       &((Keychord){1, {{MODKEY, XK_i}},                                incnmaster,     {.i = +1 } }),
       &((Keychord){1, {{MODKEY, XK_d}},                                incnmaster,     {.i = -1 } }),
       &((Keychord){1, {{MODKEY, XK_h}},                                setmfact,       {.f = -0.05} }),
       &((Keychord){1, {{MODKEY, XK_l}},                                setmfact,       {.f = +0.05} }),
       &((Keychord){1, {{MODKEY, XK_Return}},                           zoom,           {0} }),
       &((Keychord){1, {{MODKEY, XK_Tab}},                              view,           {0} }),
       &((Keychord){1, {{MODKEY, XK_t}},                                setlayout,      {.v = &layouts[0]} }),
       &((Keychord){1, {{MODKEY, XK_f}},                                setlayout,      {.v = &layouts[1]} }),
       &((Keychord){1, {{MODKEY, XK_m}},                                setlayout,      {.v = &layouts[2]} }),
       &((Keychord){1, {{MODKEY, XK_space}},                            setlayout,      {0} }),
       &((Keychord){1, {{MODKEY|ShiftMask, XK_space}},                  togglefloating, {0} }),
       &((Keychord){1, {{MODKEY, XK_0}},                                view,           {.ui = ~0 } }),
       &((Keychord){1, {{MODKEY|ShiftMask, XK_0}},                      tag,            {.ui = ~0 } }),
       &((Keychord){1, {{MODKEY, XK_comma}},                            focusmon,       {.i = -1 } }),
       &((Keychord){1, {{MODKEY, XK_period}},                           focusmon,       {.i = +1 } }),
       &((Keychord){1, {{MODKEY|ShiftMask, XK_comma}},                  tagmon,         {.i = -1 } }),
       &((Keychord){1, {{MODKEY|ShiftMask, XK_period}},                 tagmon,         {.i = +1 } }), */

       &((Keychord){1, {{MODKEY|ShiftMask, XK_q}},                             quit,           {0} }),
     TAGKEYS(                        XK_ampersand,              0)
     TAGKEYS(                        XK_eacute,                 1)
     TAGKEYS(                        XK_quotedbl,               2)
     TAGKEYS(                        XK_apostrophe,             3)
     TAGKEYS(                        XK_parenleft,              4)
     TAGKEYS(                        XK_minus,                  5)
     TAGKEYS(                        XK_7,                      6)
     TAGKEYS(                        XK_8,                      7)
     TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

