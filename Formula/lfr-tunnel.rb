class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.16/lfr-tunnel-darwin-arm64"
      sha256 "c06640db80a686aa749f343ff4a9e4510996d64daeae5379b5ad0112f13361a1"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.16/lfr-tunnel-darwin-amd64"
      sha256 "b6acc6137a03936955cef07f00ac7ad65053236c932d0d2332dc4cdb4c05a779"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.16/lfr-tunnel-linux-arm64"
      sha256 "c2bf4aa3c95bdd358cee719833224756421018383a9ee2cb0f3311c7d126853c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.16/lfr-tunnel-linux-amd64"
      sha256 "3acf385c7a8571bb217dbf804ad7590a8d02d6bde3fc04f5d66a8f27ed896c87"
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
