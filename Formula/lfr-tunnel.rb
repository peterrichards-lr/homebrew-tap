class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.49"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.49/lfr-tunnel-darwin-arm64"
      sha256 "b7fe05c9709a902b03697d837dad0d0b9f5ece1a242ec1488b9448e6b8883372"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.49/lfr-tunnel-darwin-amd64"
      sha256 "17a250b33ac4cb424d5a189a2307c2f332f26eb8f46ba261fe0421e586dcb8d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.49/lfr-tunnel-linux-arm64"
      sha256 "66160213c11a40b5788961f4abdc410ccbace0fa2fe0a23f835a3069349117eb"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.49/lfr-tunnel-linux-amd64"
      sha256 "9d2f03db1e52c4557980fb526012d62584362672c55b7b75e63e86e83e0eb3e6"
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
