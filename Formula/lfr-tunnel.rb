class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.0/lfr-tunnel-darwin-arm64"
      sha256 "517cd31b39025a5914a71996f89fb8527426d4bc2ba09864efa1c7108243a5fc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.0/lfr-tunnel-darwin-amd64"
      sha256 "6585cadacd706c5879160106c84f0aeefb5c6c2deeda16b52f6bbd8480359a8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.0/lfr-tunnel-linux-arm64"
      sha256 "33aff9ff219c37e4c9f71cd9fb99c74df3c421a964eb6ec3480ba629dd62a202"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.0/lfr-tunnel-linux-amd64"
      sha256 "8d9c1400036ba641e78d7b549bc84af3ef6b36a15f883e6c9c1571e986def0d4"
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
