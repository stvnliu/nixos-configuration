{
  pkgs,
  config,
  ...
}: {
  programs.msmtp = {
    enable = true;
    accounts = {
      default = {
        auth = true;
        tls = true;
        # try setting `tls_starttls` to `false` if sendmail hangs
        from = "<from address here>";
        host = "smtp-mail.outlook.com";
        user = "z.liu@outlook.com.gr";
        passwordeval = "cat /secrets/smtp_password.txt";
      };
    };
  };
}
