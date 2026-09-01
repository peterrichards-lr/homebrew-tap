class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.18/lfr-tunnel-darwin-arm64"
      sha256 "f227184555582b114b3f23be7d0adae135fd9787475493e71bf82d1143409880"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.18/lfr-tunnel-darwin-amd64"
      sha256 "04a5af64c836af3199d7023b48b414eb1d63024a4f0fe3e8b630aa8ed9d2ce73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.18/lfr-tunnel-linux-arm64"
      sha256 "0b6d8eeb906e856386f825c1480be8b1b0f25f4e5f887e20171df7da59231545"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.18/lfr-tunnel-linux-amd64"
      sha256 "cac846d60d071f7c56900e0bf8b268a492ee59fc3695422c7d0116a31a554ff9"
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
