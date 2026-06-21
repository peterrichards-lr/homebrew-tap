class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.2/lfr-tunnel-darwin-arm64"
      sha256 "e1e7cec839d93893f32a272c98ca8b11b85f2afa3ed61b26d562971683ca71e7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.2/lfr-tunnel-darwin-amd64"
      sha256 "6d1abf052da97518c3ba00ba33a7e71fbe2175558fffb6e21ee4ddbe5be6e594"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.2/lfr-tunnel-linux-arm64"
      sha256 "1c1654784635ee54e3ff6e9b295aa81d82e7810b3e0ac8ca09e7e07ad3dde19b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.2/lfr-tunnel-linux-amd64"
      sha256 "91bcacfefc8f335c7624f3e8847c043af7302029e8f2a89e1762a71274afb8d0"
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
