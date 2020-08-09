{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "coredhcp";
  version = "0.0.1";

  goPackagePath = "github.com/coredhcp/coredhcp";

  src = fetchFromGitHub {
    owner = "bradbeam";
    repo = "coredhcp";
    rev = "00883b66e775542f86cf907f0989bd55e526132b";
    sha256 = "0jb7v1h723c41hmpfm0c3ivgpys3rvxas9bdv24cpwxlvrhi26jn";
  };

  modSha256 = "0n1k1mr6v3pzg2ss11m66y44bbc487db7xkyw0na4vxysfzghph4";

  meta = with stdenv.lib; {
    homepage = "https://github.com/mdlayher/corerad";
    description = "CoreDHCP DHCP server";
    license = licenses.asl20;
  };
}
