class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.2/lfr-tunnel-darwin-arm64"
      sha256 "bfec28ed1a5a4c9b7781cafbb0e116fb6633d44f814e980057f6ecb8ae56b9c2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.2/lfr-tunnel-darwin-amd64"
      sha256 "3b18a6e286cfb3bbd88d9dfa1c8a3a5348f58b9de3fd90fa4885023b3ded251c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.2/lfr-tunnel-linux-arm64"
      sha256 "931bee32e2eb07494a647a482a9fd2ece23595df84ee89f2cfcbd329e0f789a9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.2/lfr-tunnel-linux-amd64"
      sha256 "3c3891cfaf556ca1a6a156f41a1438354dfa419536e2c91cbff0a8f6d00f89a3"
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
