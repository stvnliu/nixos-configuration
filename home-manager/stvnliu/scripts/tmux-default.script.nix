{
  pkgs,
  config,
}: let
  tmux = config.programs.tmux.package;
  windowName = "code-mode";
in
  pkgs.writeShellScriptBin "tmux-code" ''
    #!${pkgs.bash}/bin/bash
    ${tmux}/bin/tmux has-session -t ${windowName} 2>/dev/null
    if [ $? != 0 ]; then
      # setting up session
      ${tmux}/bin/tmux new -s ${windowName} -d
      ${tmux}/bin/tmux send-keys -t ${windowName} 'nvim' Enter
      ${tmux}/bin/tmux split-window -h
    fi
    ${tmux}/bin/tmux attach -t ${windowName}
  ''
