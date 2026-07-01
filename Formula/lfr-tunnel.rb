class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.26.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.26.1/lfr-tunnel-darwin-arm64"
      sha256 "25535f852fe5bce152b329aab424a273bf85f683b716fbc17fefe65ce9f79065"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.26.1/lfr-tunnel-darwin-amd64"
      sha256 "eaca0e9c0f28c16cab3fe27a6725d90c73f3399d476348889700cc6e10af72a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.26.1/lfr-tunnel-linux-arm64"
      sha256 "c91ab1c60291866260b23ffc0bed5281f71f0715ea8ad0003a71bb42c1358eec"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.26.1/lfr-tunnel-linux-amd64"
      sha256 "d42640b178270803296e51b9753ceeac7253b708890dcddadd7cc11ff4555e2d"
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
