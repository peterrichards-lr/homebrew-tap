class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.51.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.0/lfr-tunnel-darwin-arm64"
      sha256 "3baf5e07409dc8c3713f33bff0f39c6b0c015abb29f61a6c93f12a9ebe5000a4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.0/lfr-tunnel-darwin-amd64"
      sha256 "f8f1379ea9f53d2b492786f8200428fadf50be8e73da49d9f3b43eac58f091b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.0/lfr-tunnel-linux-arm64"
      sha256 "b940f632f1e8ac7de2568eaea39a3466a2871c531b201d2fd2aa482780b3bc09"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.0/lfr-tunnel-linux-amd64"
      sha256 "d8ecdab996313d36970c0a42ad327086440c6b7b36e9a6cc57bc95978993db1b"
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
