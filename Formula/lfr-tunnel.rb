class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.35.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.1/lfr-tunnel-darwin-arm64"
      sha256 "3774cfe105b53749ff29aa6a04a287713e2767b3dd16f771ece6beb70da0825c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.1/lfr-tunnel-darwin-amd64"
      sha256 "2e250cea6745ba7f5fd0ce0121d9f4757d26b54fc373b3d3b71cb32ace42deb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.1/lfr-tunnel-linux-arm64"
      sha256 "15819f84143b1c2009977ef86f8f046593e495ff3c12a77a6084e2a1ded21ed8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.35.1/lfr-tunnel-linux-amd64"
      sha256 "594df2ede86c10d5c4796d39e1e6ec8cd31d8c022d336709322d6f09cbe503a2"
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
