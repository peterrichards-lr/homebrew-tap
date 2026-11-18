class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.9/lfr-tunnel-darwin-arm64"
      sha256 "ab22a84717c38c9177f8e3b3c02686ab7dabf008e9de8d5a642ae99ff45f8a58"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.9/lfr-tunnel-darwin-amd64"
      sha256 "0c5cde7dde7c4bebcc64906d3413a7bc6df6495ebf5b2cd625e6b044ddd5942e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.9/lfr-tunnel-linux-arm64"
      sha256 "c24e5893f250afd6529010a0953c8652e3124e03d3bfeea291f0f0ef02e07d72"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.9/lfr-tunnel-linux-amd64"
      sha256 "aa0d8659b57a87029e4e675ac694f80c3eafd29ca5a44d44665bf7eca9996912"
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
