{
  imports =
    [(import ./programs/btop)]
    ++ [(import ./programs/fetch)]
    ++ [(import ./programs/chromium)]
    ++ [(import ./programs/git)]
    ++ [(import ./programs/freetube)]
    ++ [(import ./programs/kitty)]
    #++ [(import ./programs/librewolf)]
    ++ [(import ./programs/shell)]
    ++ [(import ./system/rice)]
    ++ [(import ./programs/yazi)]
    ++ [(import ./system/dunst)]
    ++ [(import ./system/hyprland)]
    ++ [(import ./system/ags)]
    #++ [ (import ./system/mime/) ]
    ++ [(import ./system/udiskie)]
    ++ [(import ./system/waybar)]
    #++ [ (import ./system/wlgout) ]
    ++ [(import ./system/wlsunset)]
    ++ [(import ./system/wofi)];
}
