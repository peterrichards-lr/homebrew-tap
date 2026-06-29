class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.23.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.3/lfr-tunnel-darwin-arm64"
      sha256 "56b7034a1cb27ba0348fb2a1d359e9c49b46976332af6dbb81481f42db1c5161"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.3/lfr-tunnel-darwin-amd64"
      sha256 "a220b5995f5acdd72e96edebf6b236df519fea7ba02c953dbf287adbde0a5e63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.3/lfr-tunnel-linux-arm64"
      sha256 "763e1a2141a067e5bf66b545436bd3bdec74ddee184afd11cb3fcd0ab9112814"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.3/lfr-tunnel-linux-amd64"
      sha256 "1763c544b87fa6079f80e0d2d71378bf0bc480c7324166e0c9744ea3e5538d78"
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
