class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.51"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.51/lfr-tunnel-darwin-arm64"
      sha256 "82b2e4875653717230448b8500f56c79d48d1b2f919a4ab28f36109e504545ff"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.51/lfr-tunnel-darwin-amd64"
      sha256 "d084c4ea05473940eb5210a1df2e98071958c1a6806509bd45c4025d421c4204"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.51/lfr-tunnel-linux-arm64"
      sha256 "bb08c3d8b3addb9943fee7443792d971edfa7999efca68ffc21b230f5bfef675"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.51/lfr-tunnel-linux-amd64"
      sha256 "b7b5b41408dc433dcf3ae4ed0002da83e6a6e37c63e7e5403cfc6e10f20c6e88"
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
