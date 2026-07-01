class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.26.0/lfr-tunnel-darwin-arm64"
      sha256 "fbedbce882bc999953d33a01a6a60825b4c4f23a80c0ea624f72cbba13cb74b9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.26.0/lfr-tunnel-darwin-amd64"
      sha256 "f65ed3b1fa445c2f924d65aff0ffe3752cafffa14b03316b7d944857b8d07b20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.26.0/lfr-tunnel-linux-arm64"
      sha256 "8f5714f23aadd548e44dd3f9fc7fdc9f93ede3d8ad6a3cce112875164364c86b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.26.0/lfr-tunnel-linux-amd64"
      sha256 "5e193a72ad30bd86dd5e24f57181fea169897a28c618fc68839719e1861de79b"
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
