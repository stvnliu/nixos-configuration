{ pkgs
, config
, ...
}: {
  programs.tmux = {
    enable = true;
    shell = config.myShells.defaultShell;
    terminal = "screen-256color"; # Fix for apps not recognising full color
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.cpu
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
    ];
  };
}
