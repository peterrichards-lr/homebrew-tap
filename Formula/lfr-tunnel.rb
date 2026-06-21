class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.9.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.5/lfr-tunnel-darwin-arm64"
      sha256 "b77163a8c2d26c406feb411871923f96d3193230c8b0866afc4c1ceb612d7fc3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.5/lfr-tunnel-darwin-amd64"
      sha256 "de3439343d10465d87fba7d35fe50af71a27903422c7be3af3eabc8e0869b0ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.5/lfr-tunnel-linux-arm64"
      sha256 "3d2fa9c45f79c53ea4b7bf39ab55e5dd5404e1ea7b483e9b81e3f8e1c1f8bdc6"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.5/lfr-tunnel-linux-amd64"
      sha256 "a2493edc3388fea1e33ba597c180bb140f0e274b9fd8882625551ccbcddb60b3"
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
