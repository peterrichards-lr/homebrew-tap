class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.12/lfr-tunnel-darwin-arm64"
      sha256 "818cce62b420fffe26655d6a7e0a8d3dde00df5858e0458b760e4eadd8cefd50"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.12/lfr-tunnel-darwin-amd64"
      sha256 "d70dda297a5f11ede85969499246b5f998d79d52ee598d78828546c15aa10313"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.12/lfr-tunnel-linux-arm64"
      sha256 "49c0c49a0aedd89fcd2165dd40e72651f5eaabeb034f50aed075dbd21c1622df"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.12/lfr-tunnel-linux-amd64"
      sha256 "523e781942c1b13db974abb56bc99320184ad9661639e2108b211c1a74a38416"
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
