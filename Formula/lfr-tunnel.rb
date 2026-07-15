class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.0/lfr-tunnel-darwin-arm64"
      sha256 "4843335c19cb720b95a8ad4d75a1ce1def1aa3b55902e900411cddeb02ed328e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.0/lfr-tunnel-darwin-amd64"
      sha256 "47280dedf7b70b7fb12ac39b3407d39ec6dc5f81ebcad8f7ddc10651bb81fd62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.0/lfr-tunnel-linux-arm64"
      sha256 "a0a2206bbbf2777c54ef6b6147a9bc21b2053846db8a92402e7b5d417f27f64f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.0/lfr-tunnel-linux-amd64"
      sha256 "93019b99254c0aa7890ccb9293919400255af4139ec0f108086fac9f4d6d9865"
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
