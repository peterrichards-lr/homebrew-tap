class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.38"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.38/lfr-tunnel-darwin-arm64"
      sha256 "34b7dd5b8133347679aff6282482ee801051cb578844c11f1771666b357aa8f8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.38/lfr-tunnel-darwin-amd64"
      sha256 "73271da2eb885cafe61ff480f550deb7cf03e60b514a27d8ed1d095fc3147cc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.38/lfr-tunnel-linux-arm64"
      sha256 "b6b48dc03fa396bf001848d5415d595e0d04e4d8eff030e8537ef69069e9a314"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.38/lfr-tunnel-linux-amd64"
      sha256 "3f7943aa61f5e74e39636388eebdc4017a4d272b32ea537b8a79bc2d2834d7da"
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
