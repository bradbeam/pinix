{ ... }:

{
  services.coredhcp = {
    enable = true;
    config = ''
      server4:
        plugins:
          - server_id: 192.168.2.3
          - dns: 192.168.2.3
          - router: 192.168.2.1
          - netmask: 255.255.255.0
          - range: /var/lib/coredhcp/leases.txt 192.168.2.50 192.168.2.200 1800s
          - domainname: neatfu.com
    '';
  };
}
