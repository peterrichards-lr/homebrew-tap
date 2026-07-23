class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.3/lfr-tunnel-darwin-arm64"
      sha256 "a55a4fd193d63aea0be28d2ef73fee54afb3163b23f7535a5b4b81f28504a865"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.3/lfr-tunnel-darwin-amd64"
      sha256 "7a6b8cfffc561a2a9c59b3fb72b1b16ebb4e4cc433dbc22c8705fb5c2ffe541f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.3/lfr-tunnel-linux-arm64"
      sha256 "bca43b72353edc72d3c7d4a3845422470e7b2a606e24c2041236e438b9fe3a6b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.3/lfr-tunnel-linux-amd64"
      sha256 "ae78377f03b63aaba75aaecdb9b6071b12bf0986d052d0729d448712cf070f94"
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
