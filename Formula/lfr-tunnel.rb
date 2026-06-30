class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.24.0/lfr-tunnel-darwin-arm64"
      sha256 "6c6caad0e68178f1ee99b9dd63bfe61b5e847d541db7c3d251f5e0209b4a04d1"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.24.0/lfr-tunnel-darwin-amd64"
      sha256 "33a3315222fbdf0faeec5cddd364120eb7a0a06c912b71d8a52572847ed0dbab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.24.0/lfr-tunnel-linux-arm64"
      sha256 "266f75ab2fdc3e02b9ff89d9fa76e11ed95569e08c514f671526e46c9cb4e56e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.24.0/lfr-tunnel-linux-amd64"
      sha256 "7d29f16f537c3f5191e90bc799f2c5fcc490de5752105a452ba7ead2deadee5e"
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
