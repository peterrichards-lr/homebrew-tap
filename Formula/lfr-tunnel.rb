class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.8/lfr-tunnel-darwin-arm64"
      sha256 "1f6af1f11aead03d0549089262cbb447dc3f46198e6f1881360900e0bb2d2585"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.8/lfr-tunnel-darwin-amd64"
      sha256 "7dfcbbf0a2cdfc518055cd9d383904de0eda84906b9e976175105bc73275c919"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.8/lfr-tunnel-linux-arm64"
      sha256 "b40df58792ff9bf8ee5d65b51cad8178d3714215af880440e21c539467a5390c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.8/lfr-tunnel-linux-amd64"
      sha256 "9b0abd05ac9f4dee7e5a525fae0c2d7c5b2d12225135314b0b54b9357d404edd"
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
