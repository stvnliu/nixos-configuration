{
  pkgs,
  config,
  ...
}: {
  accounts.email.accounts.default = {
    primary = true;
    address = "z.liu@outlook.com.gr";
    flavor = "outlook.office365.com";
    realName = "Zhongheng Liu";
  };
}
