class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.31.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.4/lfr-tunnel-darwin-arm64"
      sha256 "f10f5e0a38fff4c491d907ee3c38035834d50893a5b7f12c3b6db46fd35e68bf"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.4/lfr-tunnel-darwin-amd64"
      sha256 "356c1d80158c4f492762cf6e60759079471e34cf7742a46f9cc395fb4080a176"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.4/lfr-tunnel-linux-arm64"
      sha256 "9bc31b1ff57e2183c231cd061a803f4d0a9751a38262f67052af9de6e31c6740"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.4/lfr-tunnel-linux-amd64"
      sha256 "7882ebd4c55f9a30b3bbc630c6316742dc288bde37f3b99b2bf5266e8165371d"
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
