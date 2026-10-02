class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.51.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.2/lfr-tunnel-darwin-arm64"
      sha256 "2072e3b47844d016e14b26c78dd9dee27a7216327e90a4ba3bbc68b3a7fd616a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.2/lfr-tunnel-darwin-amd64"
      sha256 "e3e2eb814d81db6d944c0be159a8c9bb785983816f6908104ea21e430b66deec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.2/lfr-tunnel-linux-arm64"
      sha256 "6ac8c7b565b61ca31c70b9a0e3f4c06bb29d33b423f3c92805a9f9597cc33f38"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.2/lfr-tunnel-linux-amd64"
      sha256 "bc443a51a2953777a25d1fe5a0d5d7ae211a683bc3c1ba4fb2b418a8edb4cdd8"
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
