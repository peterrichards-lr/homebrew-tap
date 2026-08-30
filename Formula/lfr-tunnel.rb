class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.11/lfr-tunnel-darwin-arm64"
      sha256 "49e5c3a0540adf764be45560b32eefdb87e9f6f09546454d1c8c6b2e32c3df5a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.11/lfr-tunnel-darwin-amd64"
      sha256 "ad4aafad0a497ca8fe62960fe3052aacc4cfe6059671dfd709ca4741bd8f9e96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.11/lfr-tunnel-linux-arm64"
      sha256 "007e39d0625eec83ea6b82e7611f40c720435fc136b22913c196731f0e966408"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.11/lfr-tunnel-linux-amd64"
      sha256 "d7b9553dcbc6253ef0439f905686f738bec0da83e1363a96372f46a8a211fcd8"
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
