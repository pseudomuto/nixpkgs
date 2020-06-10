{ lib
, buildPythonPackage
, fetchPypi
, pytest
, setuptools_scm
, toml
}:

buildPythonPackage rec {
  pname = "jsonpickle";
  version = "1.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e8d4b7cd0bd6826001a74377df1079a76ad8bae0f909282de2554164c837c8ba";
  };

  checkInputs = [ pytest ];

  nativeBuildInputs = [
    setuptools_scm
    toml
  ];

  checkPhase = ''
    rm pytest.ini
    pytest tests/jsonpickle_test.py
  '';

  meta = {
    description = "Python library for serializing any arbitrary object graph into JSON";
    homepage = "http://jsonpickle.github.io/";
    license = lib.licenses.bsd3;
  };

}
