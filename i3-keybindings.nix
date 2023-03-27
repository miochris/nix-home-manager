mod:
{
  # "${mod}+Return" = "split h; exec terminator";
  # "${mod}+Shift+Return" = "split v; exec terminator";
  "${mod}+Return" = "split h; exec alacritty";
  "${mod}+Shift+Return" = "split v; exec alacritty";
  "${mod}+q" = "kill";
  "${mod}+d" = "exec rofi -show window -opacity 85";
  "${mod}+space" = "exec rofi -show run -opacity 85";

  "${mod}+j" = "focus down";
  "${mod}+k" = "focus up";
  "${mod}+h" = "focus left";
  "${mod}+l" = "focus right";

  "${mod}+Left" = "focus left";
  "${mod}+Down" = "focus down";
  "${mod}+Up" = "focus up";
  "${mod}+Right" = "focus right";

  "${mod}+Shift+j" = "move down";
  "${mod}+Shift+k" = "move up";
  "${mod}+Shift+h" = "move left";
  "${mod}+Shift+l" = "move right";

  "${mod}+Shift+Left" = "move left";
  "${mod}+Shift+Down" = "move down";
  "${mod}+Shift+Up" = "move up";
  "${mod}+Shift+Right" = "move right";

  "${mod}+f" = "fullscreen";

  "${mod}+Shift+m" = "exec amixer -q sset Master toggle";
  "${mod}+Alt+s" = "exec kill $(pgrep -f shutter); shutter -s";
  "XF86AudioRaiseVolume" = "exec amixer -q sset Master 10%+";
  "XF86MonBrightnessUp" = "exec xbacklight -inc 10"; # not working
  "XF86MonBrightnessDown" = "exec xbacklight -dec 10"; # not working
  "XF86AudioLowerVolume" = "exec amixer -q sset Master 10%-";
  "XF86AudioMute" = "exec amixer -q sset Master toggle";
  "${mod}+mod1+p" = "exec amixer -q sset Master 10%+";
  "${mod}+mod1+o" = "exec amixer -q sset Master 10%-";
  "${mod}+mod1+m" = "exec amixer -q sset Master toggle";
  # lock
  "${mod}+mod1+l" = "exec i3lock";

  # "${mod}+Shift+grave" = "move scratchpad";
  # "${mod}+grave" = "scratchpad show";
  "Control+shift+space" = "exec dunstctl close-all";
  "Control+space" = "exec dunstctl close";

  "${mod}+Shift+y" = "resize shrink width 10 px or 10 ppt";
  "${mod}+Shift+u" = "resize shrink height 10 px or 10 ppt";
  "${mod}+Shift+i" = "resize grow height 10 px or 10 ppt";
  "${mod}+Shift+o" = "resize grow width 10 px or 10 ppt";

  "${mod}+s" = "layout stacking";
  "${mod}+w" = "layout tabbed";
  "${mod}+e" = "layout toggle split";
  "${mod}+Shift+space" = "floating toggle";
  "${mod}+a" = "focus parent";

  "Print" = "exec gnome-screenshot -a";
  "Shift+Print" = "exec gnome-screenshot";
  "${mod}+Tab" = "workspace back_and_forth";
  "${mod}+comma" = "workspace prev";
  "${mod}+period" = "workspace next";
  "${mod}+Shift+comma" = "move workspace to output left";
  "${mod}+Shift+period" = "move workspace to output right";


  "${mod}+1" = "workspace 1";
  # "${mod}+2" = "workspace \"2: web\"";
  "${mod}+2" = "workspace 2";
  "${mod}+3" = "workspace 3";
  "${mod}+4" = "workspace 4";
  "${mod}+5" = "workspace 5";
  "${mod}+6" = "workspace 6";
  "${mod}+7" = "workspace 7";
  "${mod}+8" = "workspace 8";
  "${mod}+9" = "workspace 9";
  #"${mod}+0" = "workspace 10";
  "${mod}+Shift+1" = "move container to workspace 1";
  "${mod}+Shift+2" = "move container to workspace 2";
  "${mod}+Shift+3" = "move container to workspace 3";
  "${mod}+Shift+4" = "move container to workspace 4";
  "${mod}+Shift+5" = "move container to workspace 5";
  "${mod}+Shift+6" = "move container to workspace 6";
  "${mod}+Shift+7" = "move container to workspace 7";
  "${mod}+Shift+8" = "move container to workspace 8";
  "${mod}+Shift+9" = "move container to workspace 9";
  #"${mod}+Shift+0" = "move container to workspace 10";
  "${mod}+Shift+c" = "reload";
  "${mod}+Shift+r" = "restart";
  "${mod}+Shift+e" = "exec \"i3-nagbar -t warning -m 'Do you really want to exit i3? This will end your X session.' -b 'Y, exit' 'i3-msg exit'\"";
}

