class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.40"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.40/lfr-tunnel-darwin-arm64"
      sha256 "26b8e2a5e109a78e5762e73e9f3b2c01495005328ae71d7e69ab5c048506c2bc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.40/lfr-tunnel-darwin-amd64"
      sha256 "8d5fdc6fe088881d5778c472c9d867296fa0d9f175babf75953eaa9fa85a1d45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.40/lfr-tunnel-linux-arm64"
      sha256 "069519fef36b43b0fccc032a4a8f82f5d0d2513eba6f91360cfa06e6c7cddf44"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.40/lfr-tunnel-linux-amd64"
      sha256 "ccd716b153f4414577f39d968e237a6e4fae7a6e51e591e71a542f238f532a33"
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
