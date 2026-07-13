class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.0/lfr-tunnel-darwin-arm64"
      sha256 "e38739d88dc0b5b3359debe8780d15342eed993415d590a917e5d9c37db26e92"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.0/lfr-tunnel-darwin-amd64"
      sha256 "079c8fa1b03e55fe7bb65092af7b3d6fbc5004178cb552fab4d27534497aed16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.0/lfr-tunnel-linux-arm64"
      sha256 "f1595369ac65417ab8f936f0e5baf91bb0ee2e06a5077cadbb71fdf967861430"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.0/lfr-tunnel-linux-amd64"
      sha256 "fcc4298cb57d90be435a1dcbfd6d29228cca39d95347f7faca8f968b19389b94"
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
