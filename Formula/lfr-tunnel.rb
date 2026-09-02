class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.20/lfr-tunnel-darwin-arm64"
      sha256 "86c8a03db4829abd1f8dca4014db04934cac3420005c835f20fc54bb7aadaba4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.20/lfr-tunnel-darwin-amd64"
      sha256 "fb87abd9b1bcc7c3104aa7c6349dd320915215d0c22cdf3ba0cd69803b941e20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.20/lfr-tunnel-linux-arm64"
      sha256 "240ce90b05d5227bfd16c66b9fa1dc05551f9ca939992082255a0103884aefa0"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.20/lfr-tunnel-linux-amd64"
      sha256 "b7dc6ec3b98974980809607da6364880a69fad7a842b5efaaee81b9c21edec37"
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
