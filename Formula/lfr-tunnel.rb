class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.46"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.46/lfr-tunnel-darwin-arm64"
      sha256 "16773c4b707f6fe079f5f5a5e39134e1182857247e9ee3c70da2df2855ea79d7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.46/lfr-tunnel-darwin-amd64"
      sha256 "2252fa3a47ae52c8eef9ec6d80691ea6e918a78a0d335290ea6db37aaf382102"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.46/lfr-tunnel-linux-arm64"
      sha256 "81ca7dfbf50188aa633a43a2d0f38305ce713a2227e49874abc5f0c7c907c24f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.46/lfr-tunnel-linux-amd64"
      sha256 "c03e3940d9d2b866b6554904735f4ddf741404d5d87e183fee512e5f85bf211e"
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
