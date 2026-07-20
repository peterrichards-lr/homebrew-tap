class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.1/lfr-tunnel-darwin-arm64"
      sha256 "e0d0bfa2d4b9b8c653911cbae7b0e8449b40c6a09f578d6c9c7ab60bd9665138"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.1/lfr-tunnel-darwin-amd64"
      sha256 "dd3e5fee8fcafa43f441df00cc629a69f446d00c41861dd94eb5f6ebaba9d395"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.1/lfr-tunnel-linux-arm64"
      sha256 "3c05db54d7ac51d62e3472ad41b2528b80ac393d058a724003c2724b8ed33533"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.1/lfr-tunnel-linux-amd64"
      sha256 "64d2e151dd182d929a45e1b432ef1fb1bf56b9f2dcd11ea31ca7b6695f1b1d29"
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
