{ ...
}:
let
  rootDomainName = "stvnliu.me";
  subdomains = [
    "git"
    "kellnr"
    "www"
    "blog"
    "files"
  ];
in
{
  networking.extraHosts = ''
    # home IP mapping 
    100.91.33.34 ${rootDomainName} ${builtins.concatStringsSep " " (map (x: x + "." + rootDomainName) subdomains)}
  '';
}
