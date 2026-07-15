class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.0/lfr-tunnel-darwin-arm64"
      sha256 "d3a776e377244257c0c6eb49d28ffcba19879f89e9ac221328e3e8d1e43e00ba"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.0/lfr-tunnel-darwin-amd64"
      sha256 "5270e746b79b98469599d6ba59aa63e0beb0d817b17912af46e1fe7f5657b905"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.0/lfr-tunnel-linux-arm64"
      sha256 "a7116f7c597e8404927f1f650dd176bc1e3d920c520859e3347b1b9f202c3267"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.0/lfr-tunnel-linux-amd64"
      sha256 "9ae403babfbff0389bbb8242b7b736612b328cd76863344a5e296e654e89f1ad"
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
