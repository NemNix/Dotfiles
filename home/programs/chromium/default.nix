{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    extensions = [
      "aapbdbdomjkkjkaonfhkkikfgjllcleb" # Google Translate
      "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "oldceeleldhonbafppcapldpdifcinji" # Language tool
      "gppongmhjkpfnbhagpmjfkannfbllamg" # Wappalyzer
      "enemipdanmallpjakiehedcgjmibjihj" # Tomato Clock
    ];
    dictionaries = [
      pkgs.hunspellDictsChromium.fr_FR
      pkgs.hunspellDictsChromium.en_US
    ];
  };
}
