{config, ...}: let
  theme = config.hMods.cosmetic.theme;
in {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "akhlus";
      theme_background = false;
    };
    themes = {
      akhlus = ''
        theme[main_bg]="${theme.base00}"
        theme[main_fg]="${theme.base05}"
        theme[title]="${theme.base05}"
        theme[hi_fg]="${theme.base0D}"
        theme[selected_bg]="${theme.base03}"
        theme[selected_fg]="${theme.base0D}"
        theme[inactive_fg]="${theme.base04}"
        theme[graph_text]="${theme.base06}"
        theme[meter_bg]="${theme.base03}"
        theme[proc_misc]="${theme.base06}"
        theme[cpu_box]="${theme.base0E}"
        theme[mem_box]="${theme.base0B}"
        theme[net_box]="${theme.base0C}"
        theme[proc_box]="${theme.base0D}"
        theme[div_line]="${theme.base01}"
        theme[temp_start]="${theme.base0B}"
        theme[temp_mid]="${theme.base0A}"
        theme[temp_end]="${theme.base08}"
        theme[cpu_start]="${theme.base0B}"
        theme[cpu_mid]="${theme.base0A}"
        theme[cpu_end]="${theme.base08}"
        theme[free_start]="${theme.base0B}"
        theme[free_mid]="${theme.base0A}"
        theme[free_end]="${theme.base08}"
        theme[cached_start]="${theme.base0B}"
        theme[cached_mid]="${theme.base0A}"
        theme[cached_end]="${theme.base08}"
        theme[available_start]="${theme.base0B}"
        theme[available_mid]="${theme.base0A}"
        theme[available_end]="${theme.base08}"
        theme[used_start]="${theme.base0B}"
        theme[used_mid]="${theme.base0A}"
        theme[used_end]="${theme.base08}"
        theme[download_start]="${theme.base0B}"
        theme[download_mid]="${theme.base0A}"
        theme[download_end]="${theme.base08}"
        theme[upload_start]="${theme.base0B}"
        theme[upload_mid]="${theme.base0A}"
        theme[upload_end]="${theme.base08}"
        theme[process_start]="${theme.base0B}"
        theme[process_mid]="${theme.base0A}"
        theme[process_end]="${theme.base08}"
      '';
    };
  };
}
