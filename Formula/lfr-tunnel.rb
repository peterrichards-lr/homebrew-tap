class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.34"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.34/lfr-tunnel-darwin-arm64"
      sha256 "7f668e93cb6945dff9da8316bd0eeb7df29aa16b3ecf2219c7cf1cd891d0cd35"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.34/lfr-tunnel-darwin-amd64"
      sha256 "dce1de35dbab7a56e008634e7aed67d32141376e111bde3f88a24ac70e427881"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.34/lfr-tunnel-linux-arm64"
      sha256 "758b49b0f2a6c0e2a5a46748bb1d2c557f64d524e0aa5d501e67de98d2bd6ae1"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.34/lfr-tunnel-linux-amd64"
      sha256 "3f5ed7758a43780e7cedcac87f91ac36e8bb569f3dffeba253fd8b2ae3bcae18"
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
