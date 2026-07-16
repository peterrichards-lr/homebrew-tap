class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.36.0/lfr-tunnel-darwin-arm64"
      sha256 "eec56a4c05d8e0946de8885ac417dc524980c21eb32cf7706f05934d9c0018d7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.36.0/lfr-tunnel-darwin-amd64"
      sha256 "cf0f74b733dd210761ed927affe0d65bd7d682eed3ea242e8e3131c9b4bd5a48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.36.0/lfr-tunnel-linux-arm64"
      sha256 "a537808de54cfe36e71713d2d7e14b337c883bc62047d399cd8d8e4b912c36f2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.36.0/lfr-tunnel-linux-amd64"
      sha256 "d92ac3044dc21d0d8d07bb2b984be9c1bcf25c9ebdf8cca3d25b6084c692cbb2"
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
