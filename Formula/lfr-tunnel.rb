class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.4/lfr-tunnel-darwin-arm64"
      sha256 "ccea27645f4962ebb8baff416adacd25bac888f10d050c1c68540114a9a712a2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.4/lfr-tunnel-darwin-amd64"
      sha256 "5a2fecd65573d67d292d1677e526451bf787e1bffc2b2d1e6e4077e3bfc86717"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.4/lfr-tunnel-linux-arm64"
      sha256 "6081e358ef551e4dad3feac69fafed0bc3bf5800663436ba719a04deb29b00ff"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.4/lfr-tunnel-linux-amd64"
      sha256 "6b12975a8f5ad020864e111cd24f4bc558e1d74307f6ae72e343c4d1c314e3ad"
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
