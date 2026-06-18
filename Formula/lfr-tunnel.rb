class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.6/lfr-tunnel-darwin-arm64"
      sha256 "8a22759d3b25c2803efece309adba649b8f881c80118af7fc15f29e4a90f8a15"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.6/lfr-tunnel-darwin-amd64"
      sha256 "a5255406e6849d841650beaac77f717d07b3b5f1b0f796335faf6996417f3cef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.6/lfr-tunnel-linux-arm64"
      sha256 "fba76c2ded70c705a140c89ad5b06f16cc1bac6c7f4e27fa621bced92eb599e0"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.6/lfr-tunnel-linux-amd64"
      sha256 "679149b072ed4b7cd309d223bf4938e0747390f4fc8c7779634c36a9fa991f93"
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
