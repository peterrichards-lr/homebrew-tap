class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.23.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.6/lfr-tunnel-darwin-arm64"
      sha256 "a68c5e7dc609fd4c5f678b44ed64d7dbebcc4d11f80190ca6545240fe5b7fc52"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.6/lfr-tunnel-darwin-amd64"
      sha256 "3fe3ef7701ef7524ac6c17541b81a08c408d2924a4f45ff8d7219a9a73cb1599"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.6/lfr-tunnel-linux-arm64"
      sha256 "2d4f72f9968d6c45e5fa37b67592c8d56c3622b3f2211a6e49b0fbf86336145f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.6/lfr-tunnel-linux-amd64"
      sha256 "b6b9cf52796f2689373ecd95afda2a0943601c79e634ac2230cc4f283bc1d83c"
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
