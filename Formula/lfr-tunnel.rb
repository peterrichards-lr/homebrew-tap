class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.39.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.2/lfr-tunnel-darwin-arm64"
      sha256 "04d84d0ba5969aee5279f0ff67bd2ad0eb873e9211161efd43f0fff796d9df3d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.2/lfr-tunnel-darwin-amd64"
      sha256 "5be05aee7d35ef158db7744fd8204eac14896a80e9ac63c3ea462845dd6979f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.2/lfr-tunnel-linux-arm64"
      sha256 "578097b3155e6a96238e9e24250c5e8cc002c9fde3bc24850c2e5bbbbcbf3b53"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.2/lfr-tunnel-linux-amd64"
      sha256 "338b2aec263948c3c884ae7ba9b4422d091b4e6f4fed205895093ca3b4ca5635"
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
