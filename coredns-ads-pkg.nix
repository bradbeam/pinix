with import <nixpkgs> { };

buildGoModule rec {
  pname = "coredns-ads";
  version = "1.8.1";

  src = fetchFromGitHub {
    owner = "coredns";
    repo = "coredns";
    rev = "v${version}";
    sha256 = "04hkz70s5i7ndwyg39za3k83amvmi90rkjm8qp3w3a8fbmq4q4y6";
  };

  vendorSha256 = "1h1xcygwvpm4m6wlrv62x3kzrygc3yhydcmnvnds0bmkdga3y975";

  doCheck = false;

  # Add ads plugin to coredns
  #patches = [
  #  ./ads-plugin.patch
  #];

  overrideModAttrs = (old: {
    preBuild = ''
      go mod edit -require=github.com/c-mueller/ads@v0.2.5-0.20201010140624-51e1b415ae8f
    '';
  });

  preBuild = ''
    sed -i '/^transfer:/a ads:github.com/c-mueller/ads' plugin.cfg
    go generate
  '';

  meta = with stdenv.lib; {
    homepage = "https://coredns.io";
    description = "A DNS server that runs middleware";
    license = licenses.asl20;
    maintainers = with maintainers; [ rushmorem rtreffer deltaevo ];
  };
}
