class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.1/lfr-tunnel-darwin-arm64"
      sha256 "58e84ea34088627115c4711bba0bc8846562aa9a2e52feea474755163d1b0fa7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.1/lfr-tunnel-darwin-amd64"
      sha256 "54f3c3e4847c15287f24bb8f36adf90657f8f07c1d16e03647ca9e0a33d36487"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.1/lfr-tunnel-linux-arm64"
      sha256 "d93aaee1ad574d1dc77e43ab7b4b3a14cb998997d3f40202fc80b6bc0426f43c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.1/lfr-tunnel-linux-amd64"
      sha256 "8fbadd1da7d500a988544323f4657e71a09bd3329a004cb83848ed15fdfb2bd9"
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
