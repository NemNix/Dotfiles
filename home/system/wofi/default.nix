{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = "400";
      height = "500";
      prompt = "Apps";
      allow_images = true;
      allow_markup = true;
      term = "kitty";
      hide_scroll = true;
    };
  };
}
