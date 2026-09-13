class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.30"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.30/lfr-tunnel-darwin-arm64"
      sha256 "566248c4c66c5a418f6fabd88b90a82ca1e6d8131a99f549ea1c1e42431e52dd"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.30/lfr-tunnel-darwin-amd64"
      sha256 "5d7427badd6d3122eab83fb219b8e86e3d6870ea67adfa6d97258105b66e1b1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.30/lfr-tunnel-linux-arm64"
      sha256 "6519191e7762b7b336d847f68d5ba6a2d467ed05f963792005ab48d82ba1d99a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.30/lfr-tunnel-linux-amd64"
      sha256 "94653e9b83d24faf86c72d00c4845e3bb1f9b68bb5f07d976e104014071bf4db"
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
