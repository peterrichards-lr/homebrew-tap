class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.0/lfr-tunnel-darwin-arm64"
      sha256 "606f638460bd087ac5884cae4bc6d5518eaacca5372a0925f7f45f81f5c260fc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.0/lfr-tunnel-darwin-amd64"
      sha256 "d1e58056929c92dfeffe88eed036a1762ddb09764d71718905c0c62dd71cbdea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.0/lfr-tunnel-linux-arm64"
      sha256 "7efad5bca19876e52525ee36df82eb45411d7fd68fba4f16b6b037a3b3d0ef9c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.0/lfr-tunnel-linux-amd64"
      sha256 "4b230938a2f8c9d6affb21f3067dc2de15ff12026010c23ffc4dd10ab05dc1eb"
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
