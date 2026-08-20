class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.19/lfr-tunnel-darwin-arm64"
      sha256 "c8a0207cea634ff48c4982fb063a888f33c22a376c696ea8d6e9c60838a478c5"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.19/lfr-tunnel-darwin-amd64"
      sha256 "684604ed96ce627ba6b21e2216cdb0a0c75e2acdf3625a11f98908726c863964"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.19/lfr-tunnel-linux-arm64"
      sha256 "279b683ccc716a47f248cdfaa2a3bdb4bc13c9decf066fa73a064ca0a9ad4f56"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.19/lfr-tunnel-linux-amd64"
      sha256 "07c54e594596eed934e5cbb5c2dd94304c82ea7f58d522dda8de2a538ae06354"
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
