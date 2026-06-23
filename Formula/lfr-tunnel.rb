class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.13.1/lfr-tunnel-darwin-arm64"
      sha256 "804eeff1810090add04850b50bd34abed03ec369ee922609857f9122cc8c854f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.13.1/lfr-tunnel-darwin-amd64"
      sha256 "dd88ceede2fcdbf7784ed4664db61baf2fe453c01d140b20ea6066a40c4b9ad5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.13.1/lfr-tunnel-linux-arm64"
      sha256 "f2795dcb41be2b96ddb358ae24d69c9f7525828c6899d4cf852b5ff6dc29ff83"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.13.1/lfr-tunnel-linux-amd64"
      sha256 "1b7be0470780048788ff63ca2c1a2ba9f748618506f473bd5d444a92a21cea46"
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
