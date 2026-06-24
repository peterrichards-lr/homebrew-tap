class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.15.0/lfr-tunnel-darwin-arm64"
      sha256 "88bb38c90d4971d667ced5d4cd7498b0f315af31f02b6de04d4aff5387535ebc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.15.0/lfr-tunnel-darwin-amd64"
      sha256 "8308ed25a60cb7f6f816d71c9c25ede5830a11642a265cf37f6156ec881f8713"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.15.0/lfr-tunnel-linux-arm64"
      sha256 "a78938137f7a1f8653403b17e653d720073c91b056e600be4c42d8bb2d25fb19"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.15.0/lfr-tunnel-linux-amd64"
      sha256 "2c41a920e4afae74c3885bff873425e70d84fbb9478238d17071a9c65ce74d7b"
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
