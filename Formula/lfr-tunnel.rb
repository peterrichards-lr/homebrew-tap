class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.31.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.2/lfr-tunnel-darwin-arm64"
      sha256 "4b5dd71a74d9d3d6db59384fbd607d7fb6be90d277d0a3c5bdd95a1da266ecfa"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.2/lfr-tunnel-darwin-amd64"
      sha256 "0231a6fb538a44179458201bac8346b51f88ac0249770d6216f690b9880f355d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.2/lfr-tunnel-linux-arm64"
      sha256 "251945bcfe9cb984f3246233340570907c2d9668d8cfafa4dcaf2b9f81943d2e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.2/lfr-tunnel-linux-amd64"
      sha256 "8ac83d3785fc15d10305e5b12fe1da64b4348cbe347d2ff2c46b054db8dc47cb"
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
