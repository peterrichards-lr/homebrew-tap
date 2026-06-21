class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.9.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.3/lfr-tunnel-darwin-arm64"
      sha256 "acd14e7259e0854e5a35b9388c2adcff0001acdb3e6a86bc8f82e4ca6517707c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.3/lfr-tunnel-darwin-amd64"
      sha256 "7acdf7f6291d16d2cce2526fac339746d1801c53f99b5fceec6ced4deb92bdd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.3/lfr-tunnel-linux-arm64"
      sha256 "a3d5103f61bd1cf0595a739be2804f4f2cc822c3abb73af04ec4557f9a9be32d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.3/lfr-tunnel-linux-amd64"
      sha256 "bd084bbccf4b7799d9ef3b8ada4cbeb5ebcfdee2759cb427134e3aeeb1c76bdf"
    end
  end

  def install
    os   = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "lfr-tunnel-#{os}-#{arch}" => "lfr-tunnel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lfr-tunnel -version 2>&1")
  end
end
