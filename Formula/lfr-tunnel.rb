class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.5/lfr-tunnel-darwin-arm64"
      sha256 "2d58ee107b83d547a4d109bfd01483ca83be7da73b30d283a41a039f24056459"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.5/lfr-tunnel-darwin-amd64"
      sha256 "43caff26c16d94641d43fefd112ef4345dc6e4a71be123a6b898b5886002c115"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.5/lfr-tunnel-linux-arm64"
      sha256 "0c402cea0a29e73836657557b183e93a0b62530d815d6710346618a169f81cbc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.5/lfr-tunnel-linux-amd64"
      sha256 "b1ea7226671baa0acf659eb2a07961a47a46c7ac5f2a6022df3eb9b4a0395916"
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
