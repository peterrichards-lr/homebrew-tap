class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.1/lfr-tunnel-darwin-arm64"
      sha256 "e69937d2a77bad0dff39850d0ad7861eb92a84dfa26007490ecfd122a80fe9bc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.1/lfr-tunnel-darwin-amd64"
      sha256 "36d87adad243f1e952d78d46279d7a58c05dda01c56a25021ae48a9a48c5446d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.1/lfr-tunnel-linux-arm64"
      sha256 "58f567feebcb18a6c11f130f98e9a301aaacad4a889a02c08d01eeacabad62aa"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.1/lfr-tunnel-linux-amd64"
      sha256 "5c3e71c0722cf912bd4a4b89a86bfd3e7f1e943d4125c6b401813913e979bf1f"
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
