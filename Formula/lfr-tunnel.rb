class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.49.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.49.0/lfr-tunnel-darwin-arm64"
      sha256 "ec53d939c3244dabec63dc929feeec592bf72fd15673ffb86c5f987e3cac7a86"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.49.0/lfr-tunnel-darwin-amd64"
      sha256 "33b2d2f29c259b852fc68645559a4a4b49c3411a7b39efb60572288e86219faf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.49.0/lfr-tunnel-linux-arm64"
      sha256 "b780497d86cdfa58a2dbe43bf6bed2ff724387283365b47cf12144e434fe2e46"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.49.0/lfr-tunnel-linux-amd64"
      sha256 "3bc4c53663d644934ae48d426a22594bdd550a8e2099ae99913d3e6b54f2a729"
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
