class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.49.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.49.1/lfr-tunnel-darwin-arm64"
      sha256 "39c651cc0587daf37c777e4536e354d50d9a28bbe4a353ef9a7cda848803fe86"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.49.1/lfr-tunnel-darwin-amd64"
      sha256 "6c270592fc8b339cd38702ee047bb65a12aaf9edeeab3b0899f8618ea752c1d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.49.1/lfr-tunnel-linux-arm64"
      sha256 "8d8e5ccb34e2851e8890060b6647dc68b502f598d50a94a3ff9fd7d21f8490cc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.49.1/lfr-tunnel-linux-amd64"
      sha256 "90588d0e2bdbd75bc5cfa7251203a8105febbd515e7b18bbcdbc9187bcb301c1"
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
