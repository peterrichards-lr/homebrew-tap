class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.37"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.37/lfr-tunnel-darwin-arm64"
      sha256 "c13420a4f10ca8030b58d73265f10ebcac382c0ff4c71192a57b47c36d5f666d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.37/lfr-tunnel-darwin-amd64"
      sha256 "4f89bdd281bbe2c492c1bcceb4455dc5bc30a8b217bf26bd2c3f1808e9d358e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.37/lfr-tunnel-linux-arm64"
      sha256 "ad3a9c9335ba8160e64bbd5d79bc85fadeaf44d3b1e6030d452d3a04edac26b5"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.37/lfr-tunnel-linux-amd64"
      sha256 "b2053bfae4a73f8fbbc3d772e514bca27f63c7342d14c8e83c3fb35459b85632"
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
