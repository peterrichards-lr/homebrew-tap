class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.13/lfr-tunnel-darwin-arm64"
      sha256 "32e86ee320c7598118cd6a024f554c28ed55a43b2a5590cf466435046615885d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.13/lfr-tunnel-darwin-amd64"
      sha256 "666c6e70d3b2f162b51c48dd0722b8bb79e921286a920fed3dca0713a3e77395"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.13/lfr-tunnel-linux-arm64"
      sha256 "a05026efd6cd1be5e7916d8dcb4d395ab63456b671e318818a20ab57fcabf997"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.13/lfr-tunnel-linux-amd64"
      sha256 "7db050ae8426e535ccdb361cfe9e41b6f773947fbff92f43cdd54755e6442f02"
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
