class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.32.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.32.1/lfr-tunnel-darwin-arm64"
      sha256 "3f9060e70677df22ddcbce7610d5abc7a3da069fd330ef2d60378f7b02e4f5fc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.32.1/lfr-tunnel-darwin-amd64"
      sha256 "a4421a59685fde822dec457986a90a34afd52f054484e02de8b0b51699be40ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.32.1/lfr-tunnel-linux-arm64"
      sha256 "37026330b0d17e5efb72da7797f1e5374f234356eeb849763249206e9f6340f0"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.32.1/lfr-tunnel-linux-amd64"
      sha256 "a026b7811a4403273f9cfd30a4f07c39a682ad85c085fe8559196a2f481a35f6"
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
