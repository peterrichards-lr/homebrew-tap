class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.34.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.2/lfr-tunnel-darwin-arm64"
      sha256 "747cf94c37abe7dfae633e071231c02edd02ed55b8af068fdc17a29f48fda45e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.2/lfr-tunnel-darwin-amd64"
      sha256 "70faeb392327892eb490dfd879551953193ff6a4680a1c6b83ae33a0a1005d72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.2/lfr-tunnel-linux-arm64"
      sha256 "c56c0d9378986616aff1175325e89880d6e0a483b6ea3922f26812a93edbe095"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.2/lfr-tunnel-linux-amd64"
      sha256 "858c0e35d2438b0598a26ad81942030d452bc2f74902645514dc5b9d3b0a0329"
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
