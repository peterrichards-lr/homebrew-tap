class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.9/lfr-tunnel-darwin-arm64"
      sha256 "c857fbdc59fcffd6a29223d1ec55d0138b97b476b17f0e7e33811839a52ae794"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.9/lfr-tunnel-darwin-amd64"
      sha256 "bb770bb71f308a22f90ac6d65607db3e40b16f51fb4f47048c1ba53b4e2706ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.9/lfr-tunnel-linux-arm64"
      sha256 "0a04bb9524b7c4c25fd55f74b2e83c9a9a5a7d16993cb5275600534130e71157"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.9/lfr-tunnel-linux-amd64"
      sha256 "c80cb643a56c382efaae315175a125556d8252436698ebf8afe86f5d0e00c166"
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
