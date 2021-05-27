{ lib, stdenv, fetchFromGitHub, autoreconfHook, pkg-config, fuse3, nixosTests }:

stdenv.mkDerivation rec {
  pname = "fuse-overlayfs";
  version = "1.5.0";

  src = fetchFromGitHub {
    owner = "containers";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-/gdmrQhYsE4a/1sxtJ5IfVUWjh08wTVrOr4V7Fkn1i0=";
  };

  nativeBuildInputs = [ autoreconfHook pkg-config ];

  buildInputs = [ fuse3 ];

  passthru.tests = { inherit (nixosTests) podman; };

  meta = with lib; {
    description = "FUSE implementation for overlayfs";
    longDescription = "An implementation of overlay+shiftfs in FUSE for rootless containers.";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ma9e ] ++ teams.podman.members;
    platforms = platforms.linux;
    inherit (src.meta) homepage;
  };
}
