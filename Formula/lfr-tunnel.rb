class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.31"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.31/lfr-tunnel-darwin-arm64"
      sha256 "c94e7a318e1996bc6914b9028aed1fb3651d56ca124ed2cae23035e997f10a5d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.31/lfr-tunnel-darwin-amd64"
      sha256 "a0e6f2ee3f74bd9742e663cb95cf3854eb3febbbab4c23ad73e3f2fda0f83460"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.31/lfr-tunnel-linux-arm64"
      sha256 "8723485785cd0cd053375ef789d7b2ff6e85996a338368b3db950b3febfc5d57"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.31/lfr-tunnel-linux-amd64"
      sha256 "0a4a3a00ae5faa53a246c25741c35c985c54588ad2509456c8a4096549ceab58"
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
