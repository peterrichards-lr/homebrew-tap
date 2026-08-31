class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.14/lfr-tunnel-darwin-arm64"
      sha256 "aad8deaf4a4c7f0850194d24f601ee83b588cf602761ce8dd5e0fd66205dc3bf"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.14/lfr-tunnel-darwin-amd64"
      sha256 "d824c70f46a661cc73cf7322a6ea959d78b89a882d85a36241d7c4757b25d7e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.14/lfr-tunnel-linux-arm64"
      sha256 "4724dbef6836ab99fb1de0ef4ac1fe85c0ef70682b7589803678e111909b7a1a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.14/lfr-tunnel-linux-amd64"
      sha256 "f07f580de92138ba6874ca70af22f2b9b1cead1ff03a6b563349680d4a44ab5d"
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
