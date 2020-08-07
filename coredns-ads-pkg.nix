{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "coredns-ads";
  version = "1.7.0";

  goPackagePath = "github.com/coredns/coredns";

  src = fetchFromGitHub {
    owner = "bradbeam";
    repo = "coredns";
    rev = "783f2ef0f0168c398bc6b31a5409787fb3b48790";
    sha256 = "12yks59hv9xiaxldg2hw5pbyvzz0man2xdfdfmf304a1c32av64m";
  };

  modSha256 = "1d1k6cmajw9rh82p4qp5sm814q3qzdmzv7pp1jsm0z4kg7bbildp";

  meta = with stdenv.lib; {
    homepage = "https://github.com/mdlayher/corerad";
    description = "CoreDNS ads DNS server build with ads plugin";
    license = licenses.asl20;
  };
}
