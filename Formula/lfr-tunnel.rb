class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.10/lfr-tunnel-darwin-arm64"
      sha256 "67a496ac30bf36e1aaadfadf78e5d886fc8872810c784e7ffe1b30bda16ed9ad"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.10/lfr-tunnel-darwin-amd64"
      sha256 "3a29be370f1196d0e356afa21bdb580eafaf833c040e736c2d2bf49201197c11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.10/lfr-tunnel-linux-arm64"
      sha256 "af75fb69a580cfd20a948c654fb4288968e6faf9932d95d317b07ebd34094329"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.10/lfr-tunnel-linux-amd64"
      sha256 "344c66edfe3c208f87b09dc1535e032b591f34653609e14945cf912c9503ff32"
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
