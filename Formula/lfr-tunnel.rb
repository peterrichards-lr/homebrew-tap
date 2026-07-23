class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.0/lfr-tunnel-darwin-arm64"
      sha256 "4fb3011a45184854b2d859ff0697adcdfc1771f52f714e89b4816586fa85ffd8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.0/lfr-tunnel-darwin-amd64"
      sha256 "58ed24eb6bab5ed11af53d228c5f4205594368e25ea23724bd43aa7e363b9a0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.0/lfr-tunnel-linux-arm64"
      sha256 "47383f12160b497748ed6a11a2029aeb6a98980c9b06ea42937360397587712e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.0/lfr-tunnel-linux-amd64"
      sha256 "825f8ac36916ecbb446c64d47a64a9bdf9f1b230098e027873d6da70feff8891"
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
