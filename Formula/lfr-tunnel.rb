class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.12/lfr-tunnel-darwin-arm64"
      sha256 "56b2b0c032321a03fa80f3becb8f22d1c851a6236be59ee0f41f8768fc64229f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.12/lfr-tunnel-darwin-amd64"
      sha256 "514dac04a8c4a9af81dddb62a6f0274afd798e1313e86625fb0d70da2453833d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.12/lfr-tunnel-linux-arm64"
      sha256 "d917df472c51a12c366e779d81c4736b00fe0a15d8a9c9a745e97ad6f2cb19f0"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.12/lfr-tunnel-linux-amd64"
      sha256 "4777336f478ec77dcc2d6f9bf6e056f731be97561734aeb34845010b85ed2800"
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
