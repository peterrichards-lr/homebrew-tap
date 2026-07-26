class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.4/lfr-tunnel-darwin-arm64"
      sha256 "f0f8e03893410bb809e138717ec5179e011de8504ed0feaf01bf181fb8ac68cb"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.4/lfr-tunnel-darwin-amd64"
      sha256 "313a38f2ed3c27c5c1ff3e0e6b9ee791eed77db08e977f5ba4c23ed74d31c421"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.4/lfr-tunnel-linux-arm64"
      sha256 "ff26465c579644c7e119d54bba400d848f2464c2b22da803369d48c84ec8f9ab"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.4/lfr-tunnel-linux-amd64"
      sha256 "1a9d5cc98c1e8f2a4e03f6a89bcdc6af80b1dfd19f51c894435913da2e6f4c7d"
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
