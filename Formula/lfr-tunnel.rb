class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.8.0/lfr-tunnel-darwin-arm64"
      sha256 "9451d46fd578082a7cd3025cdd5942eeb42a9118b32f025b81f5fe3ba0f803c3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.8.0/lfr-tunnel-darwin-amd64"
      sha256 "18ed03be8fdc5c5c5c7ff432017c5678bb487f9f34aa695f1a35c635d8ef3023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.8.0/lfr-tunnel-linux-arm64"
      sha256 "1c4ae9854d16c3ae852aa79f626d85329d88970c47b7c394f598abab76adb513"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.8.0/lfr-tunnel-linux-amd64"
      sha256 "3e222940a70b2e9a6a025d326c23e9bef05e9fc6beccf18ede9ce1824ccf05b5"
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
