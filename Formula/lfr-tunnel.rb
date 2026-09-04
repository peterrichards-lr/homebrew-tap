class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.24/lfr-tunnel-darwin-arm64"
      sha256 "82738c3208bd307a80afd7c415603bc06993a1104ff759b5d3f7ca11a69e1531"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.24/lfr-tunnel-darwin-amd64"
      sha256 "e4546d18fd9aaca08a16f1b849f965630fbdd9b503ea0a44f20889ac9b64ac43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.24/lfr-tunnel-linux-arm64"
      sha256 "05b139b6bcd39a431b41618990e5d561958f7925521ee8ac4cc2cc0b53de096f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.24/lfr-tunnel-linux-amd64"
      sha256 "3c061e9b8ddbbf18db4b31ef07631bdb862abc16142bdb362eb5d1824b0027c9"
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
