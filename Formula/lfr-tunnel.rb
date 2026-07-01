class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.25.0/lfr-tunnel-darwin-arm64"
      sha256 "3e66cc9b846881c3758e9f9a160e14fcea1c91b721464f5f0a0c120127e87305"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.25.0/lfr-tunnel-darwin-amd64"
      sha256 "d7c284acbb18df75b46ef766364c08fe6d11c20a9d16f9190677829400dfb3d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.25.0/lfr-tunnel-linux-arm64"
      sha256 "b2af060168db18c70d1db32f395937246e24d48c468eea210e2e576d05f02216"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.25.0/lfr-tunnel-linux-amd64"
      sha256 "04b79c62db7f031cce58f6654203b8490c096aac6e3f7f78fa8906d8695629fb"
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
