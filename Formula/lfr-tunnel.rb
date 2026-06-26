class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.0/lfr-tunnel-darwin-arm64"
      sha256 "555caa321db4dc1801d0652a2f9da507dccfe94e3103dd90f87697e4b0b6b636"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.0/lfr-tunnel-darwin-amd64"
      sha256 "93f89ef367ae9bd9e59037db1a75380e5d6263817596ac6a2497a3a0a048b485"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.0/lfr-tunnel-linux-arm64"
      sha256 "be5888414f7d3bf8468842c7063cb18004b0e337327836972038419c12bd487f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.0/lfr-tunnel-linux-amd64"
      sha256 "bff3406fb7eed0b9ff3ce977c0d37b580466253c3c3d7f435cf9f0eaa41cc19e"
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
