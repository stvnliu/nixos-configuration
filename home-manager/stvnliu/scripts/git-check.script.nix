{ pkgs
, config
,
}:
let
  git = config.programs.git.package;
  # checks for any Git repositories with uncommitted changes
  # used because I am too lazy
in
pkgs.writeShellScriptBin "git-check" ''
  #!${pkgs.bash}/bin/bash
  cd_err() {
    echo "change-directory occurred error. interrupting..."
  }
  git_check() {
    prev=$1
    repo_dir=$2
    #echo "Checking git-cleanliness at $repo_dir, working in $PWD"
    cd "$repo_dir" || return
    inside_git_repo="$(${git}/bin/git rev-parse --is-inside-work-tree 2>/dev/null)"
    result=256
    default_skip=false
    if [ "$inside_git_repo" ]; then
      if [ "$(${git}/bin/git status --porcelain)" ]; then
        result=0
      else
        result=1
      fi
      #echo "not a git repository"
    fi
    if [[ $result -eq 0 ]]; then
      echo "DIRTY $PWD"
      if $default_skip; then return; fi
      read -rp "Enter dirty directory? [y/n/N(skip others)] " userinput
      if [[ "$userinput" = "y" ]]; then
        $SHELL
      fi
      if [[ "$userinput" = "N" ]]; then
        default_skip=true
      fi
    fi
    #echo "going back to $prev"
    cd "$prev" || return
  }
  path=$PWD
  scan_path=$PWD
  if [ -z "$1" ]; then
      scan_path=$PWD
    else
      scan_path=$1
  fi
  for item in $(find $scan_path -maxdepth 1 -type d); do
    git_check "$path" "$item"
  done
''
