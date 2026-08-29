class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.9/lfr-tunnel-darwin-arm64"
      sha256 "1e6089f298326f8c94a0cb237ac1cb345f68fb894532c435ed5383ca73f01b13"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.9/lfr-tunnel-darwin-amd64"
      sha256 "4bed228d668c3814f2065defea84e6897d47a0306dbfe5477055a04ebb939f8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.9/lfr-tunnel-linux-arm64"
      sha256 "84f4495451eed8eac0c7d906097b88afb039bc5f40d4439405e48f3ada1f7f67"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.9/lfr-tunnel-linux-amd64"
      sha256 "77d37aa911554d6365968538e0b7596cef40ccc242aee7c07b668d72b8b8c606"
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
