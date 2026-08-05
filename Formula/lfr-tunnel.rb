class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.7/lfr-tunnel-darwin-arm64"
      sha256 "037e89189e863b440b1e446386a782111904e4ffe237ceca7045bec3937aea89"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.7/lfr-tunnel-darwin-amd64"
      sha256 "5368c64adc799fb41042e3861bddde601325972f21f834bd92581350a8734bdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.7/lfr-tunnel-linux-arm64"
      sha256 "8e1774e6e0a7d25114a41810253f64fce56b9e1d2408e65f05c8246c79d67c6f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.7/lfr-tunnel-linux-amd64"
      sha256 "32705f9975ae3364d137a93b3702b73a2035c45132d1d32c6fcbe095c0f969eb"
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
