{
  #networking = {
  #  firewall = {
  #    enable = true;
  #    allowPing = true;
  #    allowedTCPPorts = [ 22 53 ];
  #    allowedUDPPorts = [ 53 67 68 ];
  #  };
  #  #hostName = "core";
  #  usePredictableInterfaceNames = false;
  #  interfaces.eth0.ipv4.addresses = [
  #    {
  #      address = "192.168.2.3";
  #      prefixLength = 24;
  #    }
  #  ];
  #  defaultGateway = "192.168.2.1";
  #  nameservers = [ 
  #    "1.1.1.1"
  #    "8.8.8.8" 
  #  ];
  #  useDHCP = false;
  #};
}
