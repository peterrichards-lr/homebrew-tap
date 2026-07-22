class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.13/lfr-tunnel-darwin-arm64"
      sha256 "b29fbe07448c156b7034df488e50304a392318a7f7e572f0d77709b6bdad264a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.13/lfr-tunnel-darwin-amd64"
      sha256 "e8c1d5a09ccf323dee8a62f0e71dcf5a22d8fcc79947f86126c2ad502ad14e29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.13/lfr-tunnel-linux-arm64"
      sha256 "4b92c0ad5d9c7f66748987161c343c5882bbcb1cd13d078c46708a29970030c6"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.13/lfr-tunnel-linux-amd64"
      sha256 "1cea313d530d05fc9a09b61001d3b7e183cc0d1d0981557e39e92022b3ef26c6"
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
