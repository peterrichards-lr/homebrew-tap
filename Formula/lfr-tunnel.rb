class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.19.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.4/lfr-tunnel-darwin-arm64"
      sha256 "f3401f804f118fa363f03ccf6cb439279e37126f4b2f0421cad4c7f48c18dbff"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.4/lfr-tunnel-darwin-amd64"
      sha256 "8a6298331cf33281b64803c39f9a490a4adbe78af59696147cfd0892d96b7dee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.4/lfr-tunnel-linux-arm64"
      sha256 "bed71e4a7364d481c5a76931142da8aac19ba0fd4fe7959eb4831ffeaeffd33d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.4/lfr-tunnel-linux-amd64"
      sha256 "3ad3773f74e4431043756712d921ece573b49de0da2e5d034133f5c13fabe2d2"
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
