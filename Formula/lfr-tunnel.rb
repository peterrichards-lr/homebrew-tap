class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.18/lfr-tunnel-darwin-arm64"
      sha256 "bc96e506bdf488abdd613076b033e9fdacc33ebd2301fdb59e79adfef214750e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.18/lfr-tunnel-darwin-amd64"
      sha256 "3fa7befac2d561b306f7ec9694060e2fad21e00adbf1303e8b11276b0ed9cec0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.18/lfr-tunnel-linux-arm64"
      sha256 "16d1acb0ebfc571725462fb6fe2b4986ffa0b71da0feef5983670ab8f16d7e39"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.18/lfr-tunnel-linux-amd64"
      sha256 "becefad57366e201a9ed40d781441281deada73ece8040cedb281f8d1c9bb81f"
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
