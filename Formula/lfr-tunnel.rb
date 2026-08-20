class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.23/lfr-tunnel-darwin-arm64"
      sha256 "e8ed49325d3c9840609cd5ddfd2e067af66af66df01044dba851a808d5176e34"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.23/lfr-tunnel-darwin-amd64"
      sha256 "984d5e5079ae37d5c64fff75324474842593dd23875110e49d746c0ef8a25f7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.23/lfr-tunnel-linux-arm64"
      sha256 "2d190f529750eee856b89d6a5cf3c25cc83df202cc84a8934a9c2a8e8f2ed972"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.23/lfr-tunnel-linux-amd64"
      sha256 "48bb3a52a3a4edc4871967f931a16ef66241b3a677b3a20d789cfa00ec64557e"
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
