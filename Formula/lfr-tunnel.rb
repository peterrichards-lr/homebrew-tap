class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.1/lfr-tunnel-darwin-arm64"
      sha256 "ca92bbc22cd1ab3e6737fad07dc739eb48f3c6ad6d6f420100265f73568d9cb2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.1/lfr-tunnel-darwin-amd64"
      sha256 "b5066daadce3d8b9830b961dd95e72aa0576c38b23281359c91270f56c344bef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.1/lfr-tunnel-linux-arm64"
      sha256 "aa420097ace79b009815e3ae42762964782a970d0f9ff43cfa98e719af17be72"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.1/lfr-tunnel-linux-amd64"
      sha256 "57f9239129e3fbdf88332413fccc5491ac21d475f64ad7c7fd78a7f6aefdace8"
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
