class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.3/lfr-tunnel-darwin-arm64"
      sha256 "65c4288c935983af27f88eb1d6b0e38ace6b5557503129fd4f4d1a046bf29261"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.3/lfr-tunnel-darwin-amd64"
      sha256 "1549ad8018a48a547cbf2f69f831ea12ab51d66d6aec4df2be3b9e5b0941f09e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.3/lfr-tunnel-linux-arm64"
      sha256 "a578a49432994a7f40491e79882407419f9272783727c29375fc8ab4686c650c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.3/lfr-tunnel-linux-amd64"
      sha256 "e62caba5291d331ab438f69c7ba92a47e4f07ea9f80604c61603f7d48a6bb638"
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
