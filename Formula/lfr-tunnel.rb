class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.23.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.1/lfr-tunnel-darwin-arm64"
      sha256 "e585ed80d31d3594fc4c310b3c995e73a916934f154e9749b67fb6aa55299ec8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.1/lfr-tunnel-darwin-amd64"
      sha256 "09988973765e44d6fb1827d2b042e456cdd0e93f22e002b69eefc72a88a56e20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.1/lfr-tunnel-linux-arm64"
      sha256 "67438c03192410d757428eb1147859546d639d4285be09b43ef3daadd3876dc4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.1/lfr-tunnel-linux-amd64"
      sha256 "053c7dccb2d49ddfaffb63e15d4c4507bb914732de5fc35babde31b7ab448720"
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
