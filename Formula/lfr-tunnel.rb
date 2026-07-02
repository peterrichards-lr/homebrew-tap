class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.28.0/lfr-tunnel-darwin-arm64"
      sha256 "6076856b9eb62fc19fa343e4c95aa08947343986694e01c31b84fafb8d008c24"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.28.0/lfr-tunnel-darwin-amd64"
      sha256 "ed3f7bd0a95e2e24da635dc93084bf1c0820496e594a01fea88b5d32ecc4fcc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.28.0/lfr-tunnel-linux-arm64"
      sha256 "2f2579da018340df08fbff8d53f37059e1e297e73a004943712e1027b5d5d841"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.28.0/lfr-tunnel-linux-amd64"
      sha256 "a6a1cafe3fedd371c6bf899a2ec5fe7b76b1cb62a5752d28e59116f99f076eb7"
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
