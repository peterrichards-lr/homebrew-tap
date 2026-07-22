class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.8/lfr-tunnel-darwin-arm64"
      sha256 "caa86456a9ca0b67dd0d3132a5b30034f36367302c99fadd34fef09cd80bfc3d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.8/lfr-tunnel-darwin-amd64"
      sha256 "c836b2781fb17bfbd580f885044c5ceb7b23d3d0f677e7bf150ab5dff857a134"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.8/lfr-tunnel-linux-arm64"
      sha256 "c35cbb71d21216c55c2c27a0e79ee7c88bb010ede0bc204f8a65c766ecc4dff8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.8/lfr-tunnel-linux-amd64"
      sha256 "c02a429f1b22fe1a619b45bce13a61707ae413a3fefb3775ad773de0ef51b548"
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
