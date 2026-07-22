class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.7/lfr-tunnel-darwin-arm64"
      sha256 "7281b543d846cce6c78039548ad9f263d759762d2822b98f02cc42a5ca670cd3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.7/lfr-tunnel-darwin-amd64"
      sha256 "e0103ae4a207bdd845e32a005097a165c70e12b42c6bf208df20f5fd1b4dbb9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.7/lfr-tunnel-linux-arm64"
      sha256 "dd098a41ae9fec7c9db7231b83b25921e62843e0ab056503cf350e1ab54bb2b3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.7/lfr-tunnel-linux-amd64"
      sha256 "95b169b898ccc0e5ae0968f84a11c9a68a33c6a6f2bf929474b2b11bd10a8d70"
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
