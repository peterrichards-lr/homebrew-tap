class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.25/lfr-tunnel-darwin-arm64"
      sha256 "a89b1831b9a298487c2b655a68785db8f4cdf1b0ab2d58cfdd1eb5631389377f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.25/lfr-tunnel-darwin-amd64"
      sha256 "621c4012e411d73057707234fe9301dab86bfe16c6ea628a3002f4cf3b28bd0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.25/lfr-tunnel-linux-arm64"
      sha256 "a35dec3f724a22795e65c74c029e96df5983f2b3a3c53651b5be5ee354530d86"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.25/lfr-tunnel-linux-amd64"
      sha256 "262cae95d5868d7759203d05e7617467d38fb2c8119daf78930a1a64a234326a"
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
