{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "coredhcp";
  version = "0.0.6";

  goPackagePath = "github.com/coredhcp/coredhcp";

  src = fetchFromGitHub {
    owner = "bradbeam";
    repo = "coredhcp";
    rev = "1552899b59250e8f72f4d0152a06ce44ef4506c5";
    sha256 = "0rpa1fs2iyh2gzyy5rapr1zdhkam7m56d25jpksr6ijaxa9vp6yn";
  };

  modSha256 = "0n1k1mr6v3pzg2ss11m66y44bbc487db7xkyw0na4vxysfzghph4";

  meta = with stdenv.lib; {
    homepage = "https://github.com/mdlayher/corerad";
    description = "CoreDHCP DHCP server";
    license = licenses.asl20;
  };
}
