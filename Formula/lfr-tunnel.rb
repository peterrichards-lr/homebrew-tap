class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.17.0/lfr-tunnel-darwin-arm64"
      sha256 "4aa28c8c2ab06b08c8bc50141b8c625f5f0b54758f44743f2c03086e218f72a9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.17.0/lfr-tunnel-darwin-amd64"
      sha256 "bf0c1748d249a0c919d9b2e482914339c55e9a00bfc6555f7107159d74d5dcd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.17.0/lfr-tunnel-linux-arm64"
      sha256 "bd7c21472a4afd282934f463196803128d55921411af0e42fa0ecd2138410887"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.17.0/lfr-tunnel-linux-amd64"
      sha256 "c88b9bd9aff06c5de7e26be8c94d7c2824220a76f264c2d5e00ad6368bb2b15b"
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
