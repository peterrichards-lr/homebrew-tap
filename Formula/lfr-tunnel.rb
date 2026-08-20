class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.15/lfr-tunnel-darwin-arm64"
      sha256 "77aa7aa9021b17d7a3a48e8010fafca014e346e27a82b0f6f6b9e683395483fb"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.15/lfr-tunnel-darwin-amd64"
      sha256 "31d946dad0a2f1d0a63444d08e51037a90ae8b2fad41392e74857f4dfd4359c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.15/lfr-tunnel-linux-arm64"
      sha256 "01bf9b3e67d91ddb6aebbf606729fdb318baa2d8e3352d501716f58ea4bb3773"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.15/lfr-tunnel-linux-amd64"
      sha256 "3fc5a9f260f283da96eddb22588d3131bbdd92e44a86932a96007cc1ac4536fe"
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
