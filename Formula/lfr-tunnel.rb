class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.0/lfr-tunnel-darwin-arm64"
      sha256 "c166e456789563eeb42d375d41c13987565b01756ab0f23f59bfb7beffdbb23b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.0/lfr-tunnel-darwin-amd64"
      sha256 "f035d8d7b566b2ffefbb696145d165f15098214b605aea1c2efb84c508efb701"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.0/lfr-tunnel-linux-arm64"
      sha256 "52c42b9cac64db0c4e7f3b9d235f5624053a43f2b4f0348cfa60eea0a17880c3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.0/lfr-tunnel-linux-amd64"
      sha256 "20636b8df01a099aabc951f908086c2c2d3a04954aaa5eaed14801575d2117f5"
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
