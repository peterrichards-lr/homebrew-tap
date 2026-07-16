class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.36.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.36.1/lfr-tunnel-darwin-arm64"
      sha256 "a4a9c65a8d448d742aa15dec3de9bf48a6f0a959c4d0854d47f1777e1ff9c249"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.36.1/lfr-tunnel-darwin-amd64"
      sha256 "7566aba134bcedb765a88aabf9de888421da18e983252c837bba416ecfae4e0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.36.1/lfr-tunnel-linux-arm64"
      sha256 "9daade0341dd136376a657b793765f3b458a91d6f8564a7974ba7c19d0f378f7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.36.1/lfr-tunnel-linux-amd64"
      sha256 "fe1b5dd6137d1d2974e04b4bef83f55252c9c984c8e1241c5b82f2ea72afc73a"
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
