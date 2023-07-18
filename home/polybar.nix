{ pkgs, ...}:
{ enable = true;

  package = pkgs.polybar.override {
    alsaSupport = true;
  };

  script = "polybar -q -r main &";

  config = let
    color = {
        background = "#1F1F1F";
        foreground = "#FFFFFF";
        foreground-alt = "#8F8F8F";
        module-fg = "#FFFFFF";
        primary = "#43a047";
        secondary = "#43a047";
        alternate = "#FFFFFF";

        white = "#FFFFFF";
        black = "#000000";
        red = "#EC7875";
        pink = "#EC407A";
        purple = "#BA68C8";
        blue = "#42A5F5";
        cyan = "#4DD0E1";
        teal = "#00B19F";
        green = "#61C766";
        lime = "#B9C244";
        yellow = "#FDD835";
        amber = "#FBC02D";
        orange = "#E57C46";
        brown = "#AC8476";
        indigo = "#6C77BB";
        gray = "#9E9E9E";
        blue-gray = "#6D8895";
    };
  in {
    "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
    };

    "bar/main" = {
        monitor-strict = false;

        override-redirect = false;

        fixed-center = true;

        width = "100%";
        height = 34;

        offset-x = "1%";
        offset-y = "2%:-2";

        background = color.background;
        foreground = color.foreground;

        radius-top = "0.0";
        radius-bottom = "0.0";

        line-size = 2;
        line-color = color.primary;

        border-bottom-size = 2;
        border-bottom-color = color.primary;

        padding = 0;

        module-margin-left = 2;
        module-margin-right = 2;

        font-0 = "Terminus:size=10;3";
        font-1 = "waffle:size=10;3";

        modules-left = "launcher workspaces temperature cpu memory";
        modules-center = "spotify";
        modules-right = "filesystem alsa backlight battery network date sysmenu";

        separator = "";

        dim-value = "1.0";

        wm-name = "";

        locale = "";

        tray-position = "none";
        tray-detached = false;
        tray-maxsize = 16;
        tray-background = color.background;
        tray-offset-x = 0;
        tray-offset-y = 0;
        tray-padding = 0;
        tray-scale = "1.0";

        enable-ipc = true;

        click-left = "";
        click-middle = "";
        click-right = "";
        scroll-up = "";
        scroll-down = "";
        double-click-left = "";
        double-click-middle = "";
        double-click-right = "";
        cursor-click = "";
        cursor-scroll = "";
    };

    "settings" = {
        throttle-output = 5;
        throttle-output-for = 10;

        screenchange-reload = false;

        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        compositing-underline = "over";
        compositing-border = "over";

        pseudo-transparency = false;
    };

    "module/temperature" = {
        type = "internal/temperature";

        interval = "0.5";

        thermal-zone = 0;

        hwmon-path = "/sys/devices/pci0000:00/0000:00:1c.0/0000:39:00.0/nvme/nvme0/hwmon0/temp2_input";

        warn-temperature = 65;

        units = true;

        format = "<ramp> <label>";

        format-warn = "<ramp> <label-warn>";

        label = "%temperature-c%";

        label-warn = "%temperature-c%";
        label-warn-foreground = color.secondary;

        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
        ramp-foreground = color.red;
    };

    "module/alsa" = {
        type = "internal/alsa";

        master-soundcard = "default";
        speaker-soundcard = "default";
        headphone-soundcard = "default";

        master-mixer = "Master";

        interval = 5;

        format-volume = "<ramp-volume> <label-volume>";

        format-muted = "<label-muted>";
        format-muted-prefix = "";

        label-volume = "%percentage%%";

        label-muted = " Muted";
        label-muted-foreground = color.foreground-alt;

        ramp-volume-0 = "";
        ramp-volume-1 = "";
        ramp-volume-2 = "";
        ramp-volume-3 = "";
        ramp-volume-4 = "";
        ramp-volume-foreground = color.green;

        ramp-headphones-0 = "";
    };

    "module/backlight" = {
        type = "internal/backlight";

        card = "intel_backlight";

        format = "<ramp> <label>";

        label = "%percentage%%";

        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
        ramp-foreground = color.gray;
    };

    "module/launcher" = {
        type = "custom/text";
        content = "";

        content-background = color.primary;
        content-foreground = color.module-fg;
        content-padding = 2;

        # click-left = "~/.config/polybar/docky/scripts/launcher.sh &";
        # click-right = "~/.config/polybar/docky/scripts/color-switch.sh &";
    };

    "module/workspaces" = {
        type = "internal/xworkspaces";

        pin-workspaces = true;

        enable-click = true;

        enable-scroll = false;

        icon-0 = "1;";
        icon-1 = "2;";
        icon-default = "";

        format = "<label-state>";
        format-padding = 0;

        label-monitor = "%name%";

        label-active = "%icon%";
        label-active-foreground = color.primary;
        label-active-overline = color.primary;

        label-occupied = "%icon%";
        label-occupied-foreground = color.alternate;

        label-urgent = "%icon%";
        label-urgent-foreground = color.secondary;

        label-empty = "%icon%";

        label-active-padding = 2;
        label-urgent-padding = 2;
        label-occupied-padding = 2;
        label-empty-padding = 2;
    };

    "module/cpu" = {
        type = "internal/cpu";

        interval = 1;

        format = "<label>";
        format-prefix = "";
        format-prefix-foreground = color.yellow;

        label = " %percentage%%";
    };

    "module/memory" = {
        type = "internal/memory";

        interval = 1;

        format = "<label>";
        format-prefix = "";
        format-prefix-foreground = color.blue;

        label = " %mb_used%";
    };

    "module/spotify" = {
    };

    "module/filesystem" = {
        type = "internal/fs";

        mount-0 = "/";

        interval = 30;

        fixed-values = true;

        format-mounted = "<label-mounted>";
        format-mounted-prefix = "";
        format-mounted-prefix-foreground = color.blue-gray;

        format-unmounted = "<label-unmounted>";
        format-unmounted-prefix = "";

        label-mounted = " %free%";

        label-unmounted = " %mountpoint%: not mounted";
    };

    "module/battery" = {
        type = "internal/battery";

        full-at = 82;

        battery = "BAT0";
        adapter = "AC";

        poll-interval = 2;

        time-format = "%H:%M";

        format-charging = "<animation-charging> <label-charging>";
        format-discharging = "<ramp-capacity> <label-discharging>";

        format-full = "<label-full>";
        format-full-prefix = " ";
        format-full-prefix-foreground = color.yellow;

        label-charging = "%percentage%%";

        label-discharging = "%percentage%%";

        label-full = "Full";

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";
        ramp-foreground = color.yellow;

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";

        animation-charging-framerate = 750;
    };

    "module/network" = {
        type = "internal/network";
        interface = "wlp0s20f3";

        interval = "1.0";

        accumulate-stats = true;

        unknown-as-up = true;

        format-connected = "<ramp-signal> <label-connected>";

        format-disconnected = "<label-disconnected>";
        format-disconnected-prefix = "";

        label-connected = "%{A1:networkmanager_dmenu &:}%essid%%{A}";

        label-disconnected = "%{A1:networkmanager_dmenu &:} Offline%{A}";

        ramp-signal-0 = "";
        ramp-signal-1 = "";
        ramp-signal-2 = "";
    };

    "module/date" = {
        type = "internal/date";

        interval = "1.0";

        time = " %I:%M %p";

        time-alt = " %a, %d %b %Y";

        format = "<label>";

        label = "%time%";
    };

    "module/sysmenu" = {
        type = "custom/text";

        content = "";

        content-background = color.primary;
        content-foreground = color.module-fg;
        content-padding = 2;

        click-left = "~/.config/polybar/docky/scripts/powermenu.sh &";
    };
  };
}
