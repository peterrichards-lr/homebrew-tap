class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.1/lfr-tunnel-darwin-arm64"
      sha256 "f3da658226f561cb304297f6ea0a383d499ac5d26feddc098e540e77e885c158"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.1/lfr-tunnel-darwin-amd64"
      sha256 "e17304ddcfe245a8e6e5639312711a2fa63b4ee0011d5e97a7254bc90f9135d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.1/lfr-tunnel-linux-arm64"
      sha256 "b7e2a208646005db8f714507a9ffe5b572f4130bc949c5a7b6c0c40a852bc87c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.1/lfr-tunnel-linux-amd64"
      sha256 "b80caf412ec3411d1f7bc6c0c14c07304c2a4c04be537e295f66c162b43af1a7"
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
