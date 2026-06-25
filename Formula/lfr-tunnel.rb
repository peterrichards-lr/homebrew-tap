class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.0/lfr-tunnel-darwin-arm64"
      sha256 "9ca94b14418e8b1fbbb3d349d0517a43b9f4817bd751b13561d16176b0231dcb"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.0/lfr-tunnel-darwin-amd64"
      sha256 "a6e3f2c9af3639745d08d9a7bbdb72e1911df2ed0cad54bd82817a372f06bcde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.0/lfr-tunnel-linux-arm64"
      sha256 "01951894ea18369d0ed91c33be007a7cbe106776d44f7ddd7d5216b69bd90be8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.19.0/lfr-tunnel-linux-amd64"
      sha256 "027ae693280fd47d44e7567cbf1afcdfe92b55dc393b2808eb2728cd3f0a3450"
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
