class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.19.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.2/lfr-tunnel-darwin-arm64"
      sha256 "5fd3d393bd29e84dec0d5c72c680410d66c665de97bdf71072f7bb295bd1ff51"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.2/lfr-tunnel-darwin-amd64"
      sha256 "8b54dba9b929b26998203890ddb778ca8cd94aa5d0e82bdb78a7a53a412c622a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.2/lfr-tunnel-linux-arm64"
      sha256 "02c42afb38a947d7cb739d51c5be5aed5d844577b478efd546f101f3ccd2c201"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.2/lfr-tunnel-linux-amd64"
      sha256 "a9fe8d0d21644dd20522af8d7468ff3dc68d62192868d1be490be689d7c4652f"
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
