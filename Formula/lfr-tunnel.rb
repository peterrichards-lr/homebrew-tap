class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.12.0/lfr-tunnel-darwin-arm64"
      sha256 "5b9e2e35e700f7b7118a9fd759aa4964339150451402c662970c679a193cd0a2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.12.0/lfr-tunnel-darwin-amd64"
      sha256 "5eb45f0f157ed2ce0c34248f39ad57c9e1c6a12c0e21a122ca463693cc07d5bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.12.0/lfr-tunnel-linux-arm64"
      sha256 "519357e84923ac78acdb9984a5a8bcffed372349481d4f04b5e1ef18d86afc1f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.12.0/lfr-tunnel-linux-amd64"
      sha256 "154a3cb20a58931b242fbbe711ccb641326845fe1c150d366463fda9176766d4"
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
