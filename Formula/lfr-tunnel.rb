class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.39"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.39/lfr-tunnel-darwin-arm64"
      sha256 "34c65668341d395e6a21323237482877b4a865d013e5a9eed8d2f6ed799a1fe8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.39/lfr-tunnel-darwin-amd64"
      sha256 "ae475ddf9a87ec0ca500c245ab619288881a1ae3f7dee14e853b52fddc2855ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.39/lfr-tunnel-linux-arm64"
      sha256 "85e5e17b6e3a4272a66fcad884e0eec70fd3f856ce1344d071500d0377dfdcf7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.39/lfr-tunnel-linux-amd64"
      sha256 "23cb43a2fc10804b5b348004148d030d6cbc4bc6d1be408b802abf6a8ee7defe"
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
