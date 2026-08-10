class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.9/lfr-tunnel-darwin-arm64"
      sha256 "765dce7b2a026dc9cd7cef14d537e388f8fba7eda18801895f7fa8ff1a386e7d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.9/lfr-tunnel-darwin-amd64"
      sha256 "36f16afbe26570819b5d0aef5a4bdaef164ce59579daf1aeda82e3d9faef9ed0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.9/lfr-tunnel-linux-arm64"
      sha256 "60b0fa860ba03ced69d0ba0870f67616ab2c5f2e18f98fe29407049c69a882ee"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.9/lfr-tunnel-linux-amd64"
      sha256 "361ad5a4bba89a1650d7f54b81c644a9f581fb49598eedc39b6ac99ddf87f377"
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
