class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.3/lfr-tunnel-darwin-arm64"
      sha256 "1e1be0244db3bd149d897c44963e48efd3409ecf6ddd1e7ee68f84cdae4343eb"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.3/lfr-tunnel-darwin-amd64"
      sha256 "3b83b3221aea0d265462d44b76daa0c8bcbf1a9bf91448270f6a9fdc6bda6107"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.3/lfr-tunnel-linux-arm64"
      sha256 "6e6af8729ff8c981dc9cbd395026d0a898f3ecb371d4d80f4d8151846dc4eea9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.3/lfr-tunnel-linux-amd64"
      sha256 "3d9fd9b5fc9222fdc14d4ed3a393178f9a669143ec37f225ae149a3c31d07102"
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
