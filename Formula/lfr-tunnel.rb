class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.15/lfr-tunnel-darwin-arm64"
      sha256 "14f0b30792b5ba4789cbeb69dc8d503e7f9968fa474c38fc978d8cf6461993bc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.15/lfr-tunnel-darwin-amd64"
      sha256 "9e7e728ca10f5ebf0a26e20d06174dd07ee36b67a0b5cba728dbeb1fe5608d70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.15/lfr-tunnel-linux-arm64"
      sha256 "0767cb594f2530a2aef942a2e60e1101048f70ef5b5917757f415aa7be1e1242"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.15/lfr-tunnel-linux-amd64"
      sha256 "f994e8de0b460bb6bf0215fdae54ae3cf24a77a4e34167234017c80cbd825dee"
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
