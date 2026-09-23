class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.53"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.53/lfr-tunnel-darwin-arm64"
      sha256 "8abecceab09c9e2a483ebcef58bc15c8bb7f41de3415778b517371f13a4bece1"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.53/lfr-tunnel-darwin-amd64"
      sha256 "83199ab11e33b58739c40e9bffd6279efce73eb436dec67aca90e00f91805fd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.53/lfr-tunnel-linux-arm64"
      sha256 "c078416344f251cf68fe68aa920326ae102c4415200fa8240039dbd07e4d0cf9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.53/lfr-tunnel-linux-amd64"
      sha256 "aa5d2c1ebc3061b4dd126060dd7316e99fcd0b6d9e4c83809d96330fc6e32db2"
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
