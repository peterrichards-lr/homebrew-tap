class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.8/lfr-tunnel-darwin-arm64"
      sha256 "af1dc3063a28150509566ec99ef5d989124d62672fb3e30626ebeee213776a99"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.8/lfr-tunnel-darwin-amd64"
      sha256 "9c2adb14f4fff048f9e969ff048a2d53d427b45f5df08966bf3c8ce91c88d1ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.8/lfr-tunnel-linux-arm64"
      sha256 "b14bd2231f22fb382e27b26a1da84f5dd1d84fec376cd90944968a3ba6e86764"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.8/lfr-tunnel-linux-amd64"
      sha256 "11fa57db0db9040e6f32207b37d6e32f952a36e0f61e44d6cdd2dd63ee30020e"
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
