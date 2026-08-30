class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.12/lfr-tunnel-darwin-arm64"
      sha256 "09aa9bae02e46bbd6b135f9ce53e76aea73c80a49bfefba7557bd7e47a50fa62"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.12/lfr-tunnel-darwin-amd64"
      sha256 "18e593d63a778eeb8ca0fed54517e1fffba0441a0b02efeac5a9a5e242650802"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.12/lfr-tunnel-linux-arm64"
      sha256 "90e51f2bc2b63fc1576f326f1c67264fc603ca1266550819bb20cc29dcc84dcd"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.12/lfr-tunnel-linux-amd64"
      sha256 "fedccdf01e0e21108d8b90213d8ea762a23345f7220b5460d4a7f5b6708a5e74"
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
