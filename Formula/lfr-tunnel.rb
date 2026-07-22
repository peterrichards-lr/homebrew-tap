class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.9/lfr-tunnel-darwin-arm64"
      sha256 "9cb54b35188c0925beb00de6136d8b18e9eb34054b7cb39eebe19541b1332f56"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.9/lfr-tunnel-darwin-amd64"
      sha256 "7a18f998d9571e07dbd63571c8df70cc57714430c3c3f9c20f5f20108bf06a2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.9/lfr-tunnel-linux-arm64"
      sha256 "2e15d51faba28e560d27d6b458e2ecafe8246214aac46ab13ebd26070cd73846"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.9/lfr-tunnel-linux-amd64"
      sha256 "f62961145808c5f4f521d921ad26081e4d1c40b3e3ad3a60c22af185ff90ee05"
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
