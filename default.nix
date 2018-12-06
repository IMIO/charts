with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "imio-plone-helm";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    kubectl
    kubernetes-helm 
  ];
}
