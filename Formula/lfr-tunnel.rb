class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.41"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.41/lfr-tunnel-darwin-arm64"
      sha256 "31bb013b553f9bb0c5d1068e7fc8da3d752a45b8489cd25020b30d753d724b3c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.41/lfr-tunnel-darwin-amd64"
      sha256 "ee68c1462479ffc67eb62ee4edc3b7743bcff9b53a91a88dbf7f075190192985"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.41/lfr-tunnel-linux-arm64"
      sha256 "38c9645034ff00395eadec3f3ea0dcd5c43194a9323b03bbaa819a05c3a54127"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.41/lfr-tunnel-linux-amd64"
      sha256 "277d4f10f96f99177b76e597b94bde036fa05cc53bcb0401942027246dd7cf3b"
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
