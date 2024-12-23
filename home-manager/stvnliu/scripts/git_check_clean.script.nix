{
  pkgs,
  config,
}: let
  git = config.programs.git.package;
in
  pkgs.writeShellScriptBin "git-check-clean" ''
        #!${pkgs.bash}/bin/bash
        cd_err() {
      echo "change-directory occurred error. interrupting..."
    }
    git_check() {
      prev=$1
      repo_dir=$2
      filter=$3
      if [[ ! "$filter" == "dirty" && ! "$filter" = "clean" ]]; then
        echo "Could not parse filter string"
        return
      fi
      #echo "Checking git-cleanliness at $repo_dir, working in $PWD"
      cd "$repo_dir" || return
      inside_git_repo="$(${git}/bin/git rev-parse --is-inside-work-tree 2>/dev/null)"
      result=256
      if [ "$inside_git_repo" ]; then
        if [ "$(${git}/bin/git status --porcelain)" ]; then
          result=0
        else
          result=1
        fi
        #echo "not a git repository"
      fi
      if [ "$filter" = "dirty" ]; then
        if [[ $result -eq 0 ]]; then
          echo "DIRTY $PWD"
          read -rp "Enter dirty directory? [y/N] " userinput
          if [[ "$userinput" = "y" ]]; then
            $SHELL
          fi
        fi
      else
        if [[ $result -eq 1 ]]; then
          echo "CLEAN $PWD"
        fi
      fi
      #echo "going back to $prev"
      cd "$prev" || return
    }
    path=$PWD
    for item in $(find . -maxdepth 1 -type d); do
      git_check "$path" "$item" "$1"
    done
  ''
