class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.35.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.3/lfr-tunnel-darwin-arm64"
      sha256 "4a94bb76ab1e657d0a16f4714099569e0b122f61b006b3b41d665527bac8517f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.3/lfr-tunnel-darwin-amd64"
      sha256 "35d37fe47384929d4700e8d8115c4c2e0b0e93b8cd198e12fcbfc6265d3258b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.3/lfr-tunnel-linux-arm64"
      sha256 "5d023a26bc775d141096bae0814a5d9f43750cebed2884d0166b4855a3e619ab"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.3/lfr-tunnel-linux-amd64"
      sha256 "cf9192dc707370c10a156c4b78bc3dc8d95caa0f4be0e2f3bf7ca31e8620df91"
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
