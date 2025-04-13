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
    "code"
    "chat"
  ];
in
{
  networking.extraHosts = ''
    # home IP mapping 
    192.168.1.100 ${rootDomainName} ${builtins.concatStringsSep " " (map (x: x + "." + rootDomainName) subdomains)}
  '';
}
