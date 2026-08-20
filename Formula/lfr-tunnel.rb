class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.17/lfr-tunnel-darwin-arm64"
      sha256 "270a8c67760023a732a986e4b9dd0a0f0c6b58e69ea1e69bfa55b2a50750e6bc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.17/lfr-tunnel-darwin-amd64"
      sha256 "8ee61271a27e144b43f25a201a8a4612be1d7454ca8139041b50eb3f29e5edf4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.17/lfr-tunnel-linux-arm64"
      sha256 "d67dee8f866cfe7fdc0d5d4c76376d1900a82acef705266e5daba6e707807e0b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.17/lfr-tunnel-linux-amd64"
      sha256 "523fbb05d21b4634d00b633b50ac4448fc0cd2e1f1ad2044845536157586116e"
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
