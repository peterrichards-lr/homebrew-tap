class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.23.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.4/lfr-tunnel-darwin-arm64"
      sha256 "501f673e4de169a6f23c8f2eec2d01d3f6ce9602d089c9527ac7e9c38fcba511"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.4/lfr-tunnel-darwin-amd64"
      sha256 "0404ae2d28dfca48b736ecdca81627a2947722189ad4ac96401ee5f73c20fe79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.4/lfr-tunnel-linux-arm64"
      sha256 "795141b671fa81a4be0c09fa76833902963bbbdf48b79c6ac5a1cf74d5c9056a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.4/lfr-tunnel-linux-amd64"
      sha256 "95e8e889d214a100168078a2a137df3faea784ea3a6101bb482f356a4b6a29ad"
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
