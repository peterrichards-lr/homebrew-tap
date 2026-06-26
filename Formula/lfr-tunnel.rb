class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.22.0/lfr-tunnel-darwin-arm64"
      sha256 "2b9ca0c5349d18a210a261ec6ba7a91f791b038b3f3b8856fecfabf65d639bd9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.22.0/lfr-tunnel-darwin-amd64"
      sha256 "aa91ab35ce5a6f36c1cf4254af3b13e8653f68f4c36d44ff1e865ab91bc3c216"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.22.0/lfr-tunnel-linux-arm64"
      sha256 "4e5f4eb8a7f2024e9273c3fc3adbef75a84e6492a4bee11f86818c6b02842c79"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.22.0/lfr-tunnel-linux-amd64"
      sha256 "8f51315fc94f12fa7d39c07dc4ab3bbc17e5c586a449af028b6a0401e99eb2d1"
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
