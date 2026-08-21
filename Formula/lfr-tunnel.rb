class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.46.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.46.0/lfr-tunnel-darwin-arm64"
      sha256 "09e8352aec23bf69205242c295822a3f59f38c837a9daadff43b43f864a56d48"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.46.0/lfr-tunnel-darwin-amd64"
      sha256 "7e8f9c45ca686de14b414ebe738cb5f7a005b26bc6fc417332060e29743756fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.46.0/lfr-tunnel-linux-arm64"
      sha256 "73686b69b59a5bd1af964cb33e2a5c8a67e8708aeb001b6a8ba42c195646f8f2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.46.0/lfr-tunnel-linux-amd64"
      sha256 "221ce2e50a409da52ecbfb89cd054f1c986cbbdffff9e166f7f7a6c364ec373b"
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
