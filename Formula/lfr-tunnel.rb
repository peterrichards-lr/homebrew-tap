class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.9.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.4/lfr-tunnel-darwin-arm64"
      sha256 "b389241dc81b0bca4953d3b466a6e487da01c22be48ba24942c0bdb80aab7a2c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.4/lfr-tunnel-darwin-amd64"
      sha256 "d56578ea37e6b46e7e91442a8d2a968e4b1e69d4b08f9e3fa2a12f3b29f034cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.4/lfr-tunnel-linux-arm64"
      sha256 "48583110a088c2503441292fe275d14526ddf9c59d4e6bd38c5b9a33179aba95"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.4/lfr-tunnel-linux-amd64"
      sha256 "1078c2a2c5f1ecd9571c571b216952a0710b7b115005ad3679ad1b2f257f878f"
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
