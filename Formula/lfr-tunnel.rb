class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.17/lfr-tunnel-darwin-arm64"
      sha256 "3b2444b9bc934c9ed4226246c4c9c2ff71847d419e472329b9d5ebf25b566482"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.17/lfr-tunnel-darwin-amd64"
      sha256 "b09af7b3fd91e3605c9f6437576b98379c7cc53f25e98337ca427d686fe688d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.17/lfr-tunnel-linux-arm64"
      sha256 "116eff28dd9c3a53e55af3e03c2472f34bbd658a443ef916c5fd36b551c741b5"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.17/lfr-tunnel-linux-amd64"
      sha256 "e6881e7885c1d378118fd36bcf19051ba51cee9fa7ff9f6936998b4d2d1aaeea"
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
