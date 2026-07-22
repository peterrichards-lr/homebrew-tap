class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.5/lfr-tunnel-darwin-arm64"
      sha256 "169bfdf11bec1dc978623d12c3e9b7218f6085b7cfe181003ff8f6fcb8433938"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.5/lfr-tunnel-darwin-amd64"
      sha256 "6d1aa1fbaa19d622e77a691119b4b6e02b40adeb9d3b8c27d9e0510d5ef629c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.5/lfr-tunnel-linux-arm64"
      sha256 "a0e211a50dcabec9633e69f41bfbcf8040d8c23f525da6cf532315d53f1697b9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.5/lfr-tunnel-linux-amd64"
      sha256 "4fa4c3d1dcbc27b0f63a57912b33a1ade671be80eda9447802310c4dd323f3be"
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
