class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.15/lfr-tunnel-darwin-arm64"
      sha256 "bbf70e07013c45fdb256ba238f3cbc843d88b84f9085871a8b8d1386597adad7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.15/lfr-tunnel-darwin-amd64"
      sha256 "e927911d5c7f04317d7e004da9476b27c0a83e1116fcfe26a1607cf7d476e6fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.15/lfr-tunnel-linux-arm64"
      sha256 "f638190871b071d761158e0943f041123bb5c85c4ba3c6b0fd4e9a2e74eba6d9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.15/lfr-tunnel-linux-amd64"
      sha256 "279e5a5f39179c9f580e4723a4706ece6baabfa854bd33463e7012ae4afa860d"
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
