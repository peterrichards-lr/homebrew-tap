class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.16.0/lfr-tunnel-darwin-arm64"
      sha256 "f83112612e7d2808597b6e3ea81378a9e48e0752f47af0b7ab7973c577b2386c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.16.0/lfr-tunnel-darwin-amd64"
      sha256 "9d0a22a8f96d8d40f361bb7231fbbaf591f20ba6fcf9c745873f8d9f07d70281"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.16.0/lfr-tunnel-linux-arm64"
      sha256 "cdafb938b7a5cedc442f1f3169a86d690bfe3fad73d4e37ac8e06cd68a81cdcf"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.16.0/lfr-tunnel-linux-amd64"
      sha256 "abfd60787a444946baf54c2474ac05a07a86ef8a570f8183b6f9e4cc88207c99"
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
