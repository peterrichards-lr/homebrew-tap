class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.5/lfr-tunnel-darwin-arm64"
      sha256 "c039a136283e7a36114107e260b919dd22c3c18c131d5a3d8ccd631240524706"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.5/lfr-tunnel-darwin-amd64"
      sha256 "54433715bc58a3c5cd09c169e9e2bc45a37c67260ffcbc78acb4bfd17494220e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.5/lfr-tunnel-linux-arm64"
      sha256 "df819ab597635a62bb89c13576d8bac742d93a29f610dc1552c9cfff400e47bb"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.5/lfr-tunnel-linux-amd64"
      sha256 "d21643ab50858c5ceb492e1a0abb2970d90faa83627b987aeca8166ebfc9da61"
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
