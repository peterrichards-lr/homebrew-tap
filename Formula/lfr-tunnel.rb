class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.21/lfr-tunnel-darwin-arm64"
      sha256 "7a0c1287b13d9e0bdf7d4f76377726b1d2d6e9b8c6cd3b6cbe41a9ea980f4212"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.21/lfr-tunnel-darwin-amd64"
      sha256 "2aabb718068e5e6236d202a8ca47f3ac7323aa8c61bb53369f0a2c2fdcae9e6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.21/lfr-tunnel-linux-arm64"
      sha256 "ce60afb842f1e7fe0e9080221f008813b1f58c68791fb3ce1085d7545c399534"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.21/lfr-tunnel-linux-amd64"
      sha256 "e8eecb9b7ce6467613512cf6a7c980bb87314d55bce510c705b322efeb1eb074"
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
