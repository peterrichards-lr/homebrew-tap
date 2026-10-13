class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.2/lfr-tunnel-darwin-arm64"
      sha256 "e595150ca5b00dd8d54e5f9dbc275ebb2368c105a29ce575035881584289e879"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.2/lfr-tunnel-darwin-amd64"
      sha256 "8cad503ef09a884858dcef26fa8993f44b7c2c226b73d0d60d00ebbdaff7f47e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.2/lfr-tunnel-linux-arm64"
      sha256 "0071a7dc50d15a243cad7b6b90f868fc936211b1b781b82b7b62b4b11ab43c1f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.2/lfr-tunnel-linux-amd64"
      sha256 "eef73ee389252322e924c6c4c3cfe9de48a21dab9ca62c5b1ace4182151544a7"
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
