class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.37.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.1/lfr-tunnel-darwin-arm64"
      sha256 "b8c7ebb0ce0961079fd6a1d0d5beeac223024aa5fe80bb38777e7ba4be38e54c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.1/lfr-tunnel-darwin-amd64"
      sha256 "09c491d56b61ba8e484e96702614b732fc7f93f8b2a0736f7c5b5eeffed2af41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.1/lfr-tunnel-linux-arm64"
      sha256 "394ed6d3709766f9dfc8ba6a732ae0165e8fe96d327014cee4a0b683172f19f8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.1/lfr-tunnel-linux-amd64"
      sha256 "2babe8c7e1de8df45a3ee8e67a1fa41089a8e26b9f9852bb956012290f71d381"
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
