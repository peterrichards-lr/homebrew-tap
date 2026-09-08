class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.26/lfr-tunnel-darwin-arm64"
      sha256 "e34edd0d06fc23af794fff1496e5a791ba5ab970ba4eb39eef77cdef412f079e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.26/lfr-tunnel-darwin-amd64"
      sha256 "60d541b37ba50b4b12ee5429f0304fc41014f7bc08011f9e57a0838d6d96ffe5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.26/lfr-tunnel-linux-arm64"
      sha256 "63f7a65fb5d5c578a4e9a0ed5664a0314479ded211afeac980dd6f3288639462"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.26/lfr-tunnel-linux-amd64"
      sha256 "0bcc8e3fc66e37f166387cceb5a62d7cab9b1f21c22b95519c8a82778531fa28"
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
