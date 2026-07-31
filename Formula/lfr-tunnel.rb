class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.6/lfr-tunnel-darwin-arm64"
      sha256 "749edb120ef858f3934f94f6692f692c2cc818d3eb87dc5468dab9648c600e58"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.6/lfr-tunnel-darwin-amd64"
      sha256 "54c28de4d4bbbfa0c76169349a887cc0ced72139de521d27bd37c403313edf17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.6/lfr-tunnel-linux-arm64"
      sha256 "ce488c523f37aec1bd16f3a0e33f93b94ab0736f1ed562cdefae7aa73b118375"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.6/lfr-tunnel-linux-amd64"
      sha256 "e2f36c3efa472ae8b638254c7e5f9d5a0eb17a8e90fe335111ecf74d57744867"
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
