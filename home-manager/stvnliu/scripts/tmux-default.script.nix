{
  pkgs,
  config,
}: let
  tmux = config.programs.tmux.package;
  windowName = "code-mode";
in
  pkgs.writeShellScriptBin "tmux-code" ''
    #!/bin/sh
    ${tmux}/bin/tmux new -s ${windowName} -d
    ${tmux}/bin/tmux send-keys -t ${windowName} nvim C-m
    ${tmux}/bin/tmux split-window -h
    ${tmux}/bin/tmux attach -t ${windowName}
  ''
