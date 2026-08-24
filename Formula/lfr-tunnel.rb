class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.2/lfr-tunnel-darwin-arm64"
      sha256 "a78af37c693cf794ec15b8434c6c22af5f31c371cbcbe9a1852d4b83923222ab"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.2/lfr-tunnel-darwin-amd64"
      sha256 "477b02730c8b4837fd6139eee24e6d721669cf3aab10f8f84b4bd1ffa508bf1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.2/lfr-tunnel-linux-arm64"
      sha256 "e4a7434183dd2443ae14672752734039450b817527e7c64679775c49cd11606f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.2/lfr-tunnel-linux-amd64"
      sha256 "a607ffbf0babfd332388116a6316705282ad6e4cfd097cda58476dc1a10db6dd"
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
