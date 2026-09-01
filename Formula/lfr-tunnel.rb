class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.16/lfr-tunnel-darwin-arm64"
      sha256 "0821398dadabb72444a96197eb27f5ff5e78c325a726b62c8b73e282e6c86a9b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.16/lfr-tunnel-darwin-amd64"
      sha256 "52d636320c884b78a82acb87c3fa3d5afb5a52858daa89b8572e2bb53b1f4db2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.16/lfr-tunnel-linux-arm64"
      sha256 "15e0a42674b55312d90e21afe79deca90510b6d69d896fb88c87aa3615fd07b1"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.16/lfr-tunnel-linux-amd64"
      sha256 "917629553925a628d550f7a1088977a3acc595a96d0a6157025e4c90eded3bbe"
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
