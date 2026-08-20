class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.20/lfr-tunnel-darwin-arm64"
      sha256 "b1b961aed2001507075824c7ad1d851e7c768a3902792a4eb527da49c305e81e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.20/lfr-tunnel-darwin-amd64"
      sha256 "2982a2f6951a529556a9231450c0046568beff7567a023521c388f1fd06b6c38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.20/lfr-tunnel-linux-arm64"
      sha256 "fdb2c29f8b50033e5bf53313b51a8bdff4dd83924292dd930be8f86f8f936150"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.20/lfr-tunnel-linux-amd64"
      sha256 "8762b4edb86e4def3f4303179fa368d98fbdbbbf8bb91fb9a6d3439ad46dac14"
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
