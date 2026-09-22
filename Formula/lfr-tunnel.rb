class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.47"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.47/lfr-tunnel-darwin-arm64"
      sha256 "0d939f0f44c342417c5cbed0ffc59fbb161f4e8851a5d3df943e938fb63356a3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.47/lfr-tunnel-darwin-amd64"
      sha256 "d981b93d6c278274b26ee82e41c59a744b818b94374a7138bbcf7f83a2fe60ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.47/lfr-tunnel-linux-arm64"
      sha256 "decfe3e924deb5ce0c44e30fc556b4adec09a2e9ede261f5b9e6d96793cc5177"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.47/lfr-tunnel-linux-amd64"
      sha256 "6ad610fe4e7a2490d5eef92121b3d3b887a2ea9ecf09832e2b9a02e05fb6d61d"
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
