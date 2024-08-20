{
  pkgs,
  config,
  ...
}: {
  config = {
    #home.packages = with pkgs; [ ags ];
    myAutostartCommands = ["${pkgs.ags}/bin/ags"];
  };
}
