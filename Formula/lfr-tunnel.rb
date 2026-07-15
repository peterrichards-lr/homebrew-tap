class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.34.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.4/lfr-tunnel-darwin-arm64"
      sha256 "21d9814e51f03708dca1ffaba173781eeb52ee03b014e4c773483b6aacd3546b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.4/lfr-tunnel-darwin-amd64"
      sha256 "709468ca40be06ce652f012a5bada4eebb7ced28cda3ec11f19a3010100c7b0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.4/lfr-tunnel-linux-arm64"
      sha256 "951ea489f626b8e833861a6cd7d0b3a7d26ce5f298f15b3189329e43a47f77de"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.4/lfr-tunnel-linux-amd64"
      sha256 "8a50994426534eae42b5cea2c92375884a58a78c207f4435827c17d1f1d0b885"
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
