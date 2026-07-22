class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.11/lfr-tunnel-darwin-arm64"
      sha256 "4a77d2eaf4bfb712e9d18c11cef526552f2f7524c7a4053440dac3f80240b50f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.11/lfr-tunnel-darwin-amd64"
      sha256 "c6a826eef10f548bff1ad0f55e3d139be9cfc2057ba8ee692f7cbd3822351449"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.11/lfr-tunnel-linux-arm64"
      sha256 "fd792331acb3ebb3f093154740988a7fcf893fa04d7726993547655ff3451c45"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.11/lfr-tunnel-linux-amd64"
      sha256 "a1fcc434188af6bdbd3a5d9391d1f6c0b99fce7d8bad3029fca9d40470105848"
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
