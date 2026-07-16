class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.38.0/lfr-tunnel-darwin-arm64"
      sha256 "7023a6693febd542c9f9a1a4c7b8ffdcd27b85b2f373f30b3479391479bbed07"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.38.0/lfr-tunnel-darwin-amd64"
      sha256 "3c571456a42a02e4c950cd9e493e4b842db89a5dfcca42fd0847b38ef2fbde3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.38.0/lfr-tunnel-linux-arm64"
      sha256 "7c5714b65c7a85fbefc65efb56f09a3ae19341f9e474778967225c98e869ac00"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.38.0/lfr-tunnel-linux-amd64"
      sha256 "265ee064af5524570a264b9bb2e2ab375a25f01b3435172df6b065f7ceebfe23"
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
