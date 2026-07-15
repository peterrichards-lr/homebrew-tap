class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.33.0/lfr-tunnel-darwin-arm64"
      sha256 "702649fa17cdeb1ba2c96d5f76e2955c9d7d575995a2051fde19de0fa518c3f8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.33.0/lfr-tunnel-darwin-amd64"
      sha256 "877ee5376d0f1f923982ab2995fa9200d9505404510c22ee8173c46620987620"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.33.0/lfr-tunnel-linux-arm64"
      sha256 "e79bae948289e8f5c6f6bc057139dc5024709ec90d0fdbe69a35eccfde052a87"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.33.0/lfr-tunnel-linux-amd64"
      sha256 "a19275a2e7589cc1fe1a7a5a655be29d888d89caae8f70b9be30d03e5665cd3c"
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
