class Fpp < Formula
  homepage "https://facebook.github.io/PathPicker/"
  url "https://github.com/facebook/PathPicker/releases/download/0.5.7/fpp.0.5.7.tar.gz"
  sha256 "1293e9510b2d7c1f83320d11cd2f3034545f92daffb6d8de3ee3c8a563972783"
  head "https://github.com/facebook/pathpicker.git"

  bottle do
    cellar :any
    sha256 "2deb167b4dd052e599b7585a12bc43313e1a255da930022378f1cf53aee3c78e" => :yosemite
    sha256 "29e5e0a547a363f544d39f12b712000e18e555c7b16f1d548af47e138cd4185f" => :mavericks
    sha256 "21bf8171dce1011c411674f00869b067290247ffced0fa1e6170d827503ca46f" => :mountain_lion
  end

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    # we need to copy the bash file and source python files
    libexec.install Dir["*"]
    # and then symlink the bash file
    bin.install_symlink libexec/"fpp"
  end

  test do
    system bin/"fpp", "--help"
  end
end
