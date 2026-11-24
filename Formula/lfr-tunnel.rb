class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.11/lfr-tunnel-darwin-arm64"
      sha256 "67665928528d3b07db310328f7dacf26e1c5b8b6a84b51dbbc0e18d5559bd064"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.11/lfr-tunnel-darwin-amd64"
      sha256 "186c805aa45cb0f7ad77250c7126a7a1a3e2128bdf844c23bc4442d91f6a8012"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.11/lfr-tunnel-linux-arm64"
      sha256 "5d6cd804e0fb8d4dfc80ddd3f5d3868d1d7f16bc90cb9a55f873e5850d852b73"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.11/lfr-tunnel-linux-amd64"
      sha256 "7818255776e003ccee709c78069a391f97140d7528dc85b76584ba670d5cba64"
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
