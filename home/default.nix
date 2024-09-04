{
  imports =
    [(import ./programs/btop)]
    ++ [(import ./programs/fetch)]
    ++ [(import ./programs/git)]
    ++ [(import ./programs/freetube)]
    ++ [(import ./programs/kitty)]
    ++ [(import ./programs/librewolf)]
    ++ [(import ./programs/shell)]
    ++ [(import ./programs/yazi)]
    ++ [(import ./system/dunst)]
    ++ [(import ./system/hyprland)]
    #++ [ (import ./system/mime/) ]
    ++ [(import ./system/udiskie)]
    ++ [(import ./system/waybar)]
    #++ [ (import ./system/wlgout) ]
    ++ [(import ./system/wlsunset)]
    ++ [(import ./system/wofi)];
}
