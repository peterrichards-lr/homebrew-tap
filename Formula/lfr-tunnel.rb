class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.29.0/lfr-tunnel-darwin-arm64"
      sha256 "ebc17a9a47b11c6add8c8cfd934d9b110499ea90f2f0ed03d31dd44805e40d6d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.29.0/lfr-tunnel-darwin-amd64"
      sha256 "c2391f1c4c1f7445998812a103a03c5489ccae38229049e0ff5a5743918db110"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.29.0/lfr-tunnel-linux-arm64"
      sha256 "539ec3535c6dbb16f094a70378350973a1e4ffd574a0b7bd0482490870df34c1"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.29.0/lfr-tunnel-linux-amd64"
      sha256 "8d01b742a7071d7c49ad41ad31f65f6861b0c3f168225f9b97baaa86f599ffdd"
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
