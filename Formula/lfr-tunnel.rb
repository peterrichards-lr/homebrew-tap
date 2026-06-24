class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.14.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.3/lfr-tunnel-darwin-arm64"
      sha256 "d4ab85dd8e302e71bfe5a37b08cf76f3e25601f4a7bbb3c4379395542c53d956"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.3/lfr-tunnel-darwin-amd64"
      sha256 "5acf0880d612141d51e0d144b5518ba26734ed8597ccf22d864164b45c07fa90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.3/lfr-tunnel-linux-arm64"
      sha256 "be95da3000ff29b5e9d4b35281f87580e7dbfe6ca0aedf447ba8c69e75721f3b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.3/lfr-tunnel-linux-amd64"
      sha256 "5c135a1a7c50197191df4816a4f892e7e49b02a5a455f9d0176d4ff4d0c12585"
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
