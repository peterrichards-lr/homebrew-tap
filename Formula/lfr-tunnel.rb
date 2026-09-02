class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.21/lfr-tunnel-darwin-arm64"
      sha256 "56a49048a91d6b4d23c4667cba555b213fa3e764fc5b99e3ee5a85ea43c9e1c4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.21/lfr-tunnel-darwin-amd64"
      sha256 "438567d5bc89892f5e070ae8f34ee4e389b840ecb20047111b890c61d37de014"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.21/lfr-tunnel-linux-arm64"
      sha256 "da11873b7897cc5dbbefe723ed8231a4fef831cf4e35e389db03f1334e1f28f9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.21/lfr-tunnel-linux-amd64"
      sha256 "3bfb9a7c06328c13bcd26818b6312b835ee81072bc554aa4607bc16967e3705c"
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
