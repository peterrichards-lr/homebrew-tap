class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.32.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.32.2/lfr-tunnel-darwin-arm64"
      sha256 "0ef5fbc18ade3e0eb405b1ce583a85d5f96a40bf168e0f0b7c217ab6bcb53c10"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.32.2/lfr-tunnel-darwin-amd64"
      sha256 "311b4c9f4ac60563dd7211f43b3f66fea7f0a8fbdbfe98d915869cce1744c8ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.32.2/lfr-tunnel-linux-arm64"
      sha256 "603c19365f0ee08b639416dc3656de73f266a4bdc07867ba8d4e343cc11fdb27"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.32.2/lfr-tunnel-linux-amd64"
      sha256 "528cd1aee1ed481a4533ab553a91177c094d81f774a735252b97ad2ffd600993"
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
