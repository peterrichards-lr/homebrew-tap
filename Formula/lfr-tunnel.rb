class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.11/lfr-tunnel-darwin-arm64"
      sha256 "ea9639ff53bedf4d76ea83867555058509af16ce4a518cf14b6ec33950b77ecb"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.11/lfr-tunnel-darwin-amd64"
      sha256 "ca60a841fe612af29b00982019d6354eed83cba068f8dd3259e4104a43a453aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.11/lfr-tunnel-linux-arm64"
      sha256 "f5461ec1031929345de5fe048a64f76624944cd7a5e1b4930a9026bc6d8fe205"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.11/lfr-tunnel-linux-amd64"
      sha256 "3012a88a84492bb17304a57e42f3a82ca162768cedebe75ddfef76cdcac1cf37"
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
