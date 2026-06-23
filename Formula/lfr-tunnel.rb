class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.0/lfr-tunnel-darwin-arm64"
      sha256 "723e37d4dc7f48276b71e2d294368f37437ff01a13878ed3c92f7ee0c005cbaa"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.0/lfr-tunnel-darwin-amd64"
      sha256 "1a40a9ad261325ab96274b177b78dafbe65bcf1248ae40ab00a6bde25edc4324"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.0/lfr-tunnel-linux-arm64"
      sha256 "7749438b5cc35b19c8aa809a73f5658b067c430a8c4fd65705bbe240410ba908"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.0/lfr-tunnel-linux-amd64"
      sha256 "173c40d9becd9dd0c31f778c20b7e22ecb6ac2d3d2e5a84147d26f6b87577e6d"
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
