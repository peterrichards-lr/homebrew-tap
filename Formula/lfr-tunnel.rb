class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.22/lfr-tunnel-darwin-arm64"
      sha256 "fd575e679f9aef82c6ad77945b63d1d7f1c33c78efd904fd4186bfae93be74f4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.22/lfr-tunnel-darwin-amd64"
      sha256 "79dccd4a9b2ea02300f1ce477147ecf8678bda883098d27d069c539196423c32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.22/lfr-tunnel-linux-arm64"
      sha256 "c887dd0daaf2937ee99be853fd429303476b082799540a3fee3a8b003c069cbf"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.22/lfr-tunnel-linux-amd64"
      sha256 "aa89d5c50677f35a702771e95aeb8b6a91155973baf4fe82adc90031383fd38e"
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
