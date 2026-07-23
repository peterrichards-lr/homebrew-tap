class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.2/lfr-tunnel-darwin-arm64"
      sha256 "bb75858cf20f17144fb8eed087526a61501cad1a8521dd5d5e0a2bfdd54a782d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.2/lfr-tunnel-darwin-amd64"
      sha256 "3b7b026494041055047e074a41d5073ef08fb579ef3089e099241d03a173c2e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.2/lfr-tunnel-linux-arm64"
      sha256 "69b213672c025fc6699cfd561dec63a156d54c0466437dff8ecdf05a9d9da6a9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.2/lfr-tunnel-linux-amd64"
      sha256 "60675ad753eb739543ce4be3ef3e366f3311cc422548614d449184c011e9aca9"
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
