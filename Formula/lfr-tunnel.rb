class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.23/lfr-tunnel-darwin-arm64"
      sha256 "ab20c272f0d8e2a8ee3a970e628b27878dfd3dfe00e23f6a1a5c0e392693556b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.23/lfr-tunnel-darwin-amd64"
      sha256 "1c140c3b6608bcdd59e0455392c6eb8523d9dbd5cec46b368c7b8fe13de08175"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.23/lfr-tunnel-linux-arm64"
      sha256 "da31f2ebdef1eb2273da70d8b869857cbe51169849c2f06a391339dc41579857"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.23/lfr-tunnel-linux-amd64"
      sha256 "3e0284136a40f2d6c2b297a01ad342da07c16c7f7ee1f5bfa841c4cb76258b8e"
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
