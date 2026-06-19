class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.11/lfr-tunnel-darwin-arm64"
      sha256 "8615cd6de1d6ece1c4e63a001d2a539fadf7fe4d00d5da8f5a930e33f977280a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.11/lfr-tunnel-darwin-amd64"
      sha256 "572a65ab8eae5c895476fcbaf3fcd541c38478c1601eff6886141ae0f0f197b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.11/lfr-tunnel-linux-arm64"
      sha256 "4eecc7570436e4ffa4a397838d4e1bfa3a46237a705b4949bf4a2a9366b0f31a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.11/lfr-tunnel-linux-amd64"
      sha256 "be1f5cf4b3d4e86ba73ee6e60904b94fa1102b9e06599bcdafff5c5c1ee8a942"
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
