class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.35.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.2/lfr-tunnel-darwin-arm64"
      sha256 "6931b22010170d0451e1536bda01afe01e716c1a0b9e3fa109cffa61f8cf93c2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.2/lfr-tunnel-darwin-amd64"
      sha256 "aa8ee8343ac14ddade7a8708b89e5a639bb3d12ccfd518e0824e53071a1e97ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.2/lfr-tunnel-linux-arm64"
      sha256 "d125f58d77bf559f2a09dadccaa71aa7f33953d9c083dd9c9e4f6cb90581c543"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.2/lfr-tunnel-linux-amd64"
      sha256 "f350bf49c65801ac4507bbb5488bca19caef80924dfeddde1c17752c7f6f7459"
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
