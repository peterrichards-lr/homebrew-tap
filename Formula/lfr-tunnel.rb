class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.27/lfr-tunnel-darwin-arm64"
      sha256 "38480447b1687056e5430dec1ee1a11d4c03ac1afe2ab6f9f7bfc17bba4ea593"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.27/lfr-tunnel-darwin-amd64"
      sha256 "51a391aa3af3f3c030067eb5135d7f983298c31efd6c152cae1487421389df15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.27/lfr-tunnel-linux-arm64"
      sha256 "6501eab8bc55c271a6e03c3f5d6374f2f2a533b72dc21d902f05717889fc6f66"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.27/lfr-tunnel-linux-amd64"
      sha256 "fb62e776825d2ea2b545343a6041028463fda767143a7a6a6b9d9c6b1df90e8b"
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
