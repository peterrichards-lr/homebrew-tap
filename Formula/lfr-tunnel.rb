class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.0/lfr-tunnel-darwin-arm64"
      sha256 "7032679aa5ed30cb757b20ae171b97caf7ffa5310e1d6605f6aee172854b396f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.0/lfr-tunnel-darwin-amd64"
      sha256 "2e9751d22eaceef6ccb4c5036cf2557b947d8cc836f11b89eb6a6081b321aeb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.0/lfr-tunnel-linux-arm64"
      sha256 "45b3fb9b6763002d1341c7ea8bc02807c45585dd4e7a75df46c8026870c5ad04"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.0/lfr-tunnel-linux-amd64"
      sha256 "7687730ad9809fbd4ea02a5c2f80899a4cc5f0957401e3f451f7d7df3e3497f1"
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
