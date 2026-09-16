class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.35"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.35/lfr-tunnel-darwin-arm64"
      sha256 "abf03b5f1ee6eb510f8468fb549e3b692bed944ec7a8b3672f89aed8ffbc9226"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.35/lfr-tunnel-darwin-amd64"
      sha256 "048f9fe751a3cc239661c762fe309054ac015a08a221ae4c961a02bbc81dcacb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.35/lfr-tunnel-linux-arm64"
      sha256 "fa6734bf52118821a35139deb2f1cc0ac5535b9b72ef6f0e7fd92ee9a90aa476"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.35/lfr-tunnel-linux-amd64"
      sha256 "7a4bcc753e67adac7274679878e371ddc0405ecf5d8c3b379e0ccc88dadaf292"
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
