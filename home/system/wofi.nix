{
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      width = 450;
      terminal = "foot";
      height = "305px";
      orientation = "vertical";
      halign = "fill";
      show = "drun";
      normal_window = false;
      layer = "top";
      gtk_dark = true;
      line_wrap = "off";
      dynamic_lines = false;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      filter_rate = 100;
      key_expand = "Tab";
      key_exit = "Escape";
    };

    style = ''
            /** ********** Fonts ********** **/

           * {
          font-size: 14px;
          font-weight: 800;
      }

      #window {
          background-color: @theme_base_color;
          color: @theme_text_color;
      }

      #outer-box {
          padding: 20px;
      }

      #input {
          background-color: #181825;
          border: #313244;
          padding: 8px 12px;
      }

      #scroll {
          margin-top: 20px;
      }

      #inner-box {}

      #img {
          padding-right: 8px;
      }

      #text {
          color: #cdd6f4;
      }

      #text:selected {
          color: #f5e0dc;
      }

      #entry {
          padding: 6px;
      }

      #entry:selected {
      background-image: linear-gradient(
      to right,
      #F5A97F,
      #ED8796,
      #C6A0F6,
      #8AADF4,
      #A6DA95,
      #EED49F
      );
      color: #cdd6f4;
      }

      #unselected {}

      #selected {}

      #input,
      #entry:selected {
          border-radius: 20px;
      }
    '';
  };
}
