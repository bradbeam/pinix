{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.coredns-ads;
  configFile = pkgs.writeText "Corefile" cfg.config;
in {
  options.services.coredns-ads = {
    enable = mkEnableOption "CoreDNS DNS server";

    config = mkOption {
      default = "";
      example = ''
        .:53 {
          loadbalance round_robin
          forward . 1.1.1.1 8.8.8.8
          log
          errors
          prometheus :9100
        }
      '';
      type = types.lines;
      description = ''
        Basic forwarding coredns configuration.'';
    };

    package = mkOption {
      default = pkgs.coredns-ads;
      defaultText = "pkgs.coredns-ads";
      type = types.package;
      description = "coredns-ads package to use.";
    };
  };

  config = mkIf cfg.enable {
    systemd.services.coredns-ads = {
      description = "CoreDNS DNS server";
      after = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        PermissionsStartOnly = true;
        LimitNPROC = 512;
        LimitNOFILE = 1048576;
        CapabilityBoundingSet = "cap_net_bind_service";
        AmbientCapabilities = "cap_net_bind_service";
        NoNewPrivileges = true;
        DynamicUser = true;
        # TODO figure out how/where dir structure is to create autoconf + lists dir
        ExecStart = "${getBin cfg.package}/bin/coredns -conf=${configFile}";
        ExecReload = "/bin/kill -SIGUSR1 $MAINPID";
        Restart = "on-failure";
      };
    };
  };
}
