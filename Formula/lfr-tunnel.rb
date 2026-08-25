class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.5/lfr-tunnel-darwin-arm64"
      sha256 "a118e92ecfbfe492c73a265a37c49adc45678d5acecf68f16494a2aaec01ae70"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.5/lfr-tunnel-darwin-amd64"
      sha256 "aca63465616a9ca602267f710a14adeab9fbc15d1021d5047014956d90f06810"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.5/lfr-tunnel-linux-arm64"
      sha256 "e5b4240fb438cb8b5e2ae280015e743ec82be29722c2994e5fa746746093d633"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.5/lfr-tunnel-linux-amd64"
      sha256 "36d2a055f9e907fee79a44c5f485f0b57ef62c63a554707fb117ec19983b0a09"
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
