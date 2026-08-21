class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.45.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.45.0/lfr-tunnel-darwin-arm64"
      sha256 "5dd0b37794b26f563351a4f90bc861b1e04c9808c53e7ae7c330f980117f8096"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.45.0/lfr-tunnel-darwin-amd64"
      sha256 "a6b08da84b01d7cb41219b38412429253e1b2e91a3455bcbdbfc66471b124c6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.45.0/lfr-tunnel-linux-arm64"
      sha256 "d545305d5ce5a635d369a9d240dab6ed0354425ac2f1edf8248fa447b80e2307"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.45.0/lfr-tunnel-linux-amd64"
      sha256 "23da5e66123c5cfd0f7ade993810c3e781b78b1cc93f04763981c91b7665390c"
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
