class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.16.1/lfr-tunnel-darwin-arm64"
      sha256 "8a6e17fce8970676a0a99689e7b1d6e3b02a50055ff1f8c67740da4ba41d8d0f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.16.1/lfr-tunnel-darwin-amd64"
      sha256 "f8ea1dae3886d4bbc00199662da2aa45429c0caec1964eb277f2a7f7a414d998"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.16.1/lfr-tunnel-linux-arm64"
      sha256 "71f8f52e91eec28927057a081c05a3e683e41716ae5bbac821f3a29583ab05b8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.16.1/lfr-tunnel-linux-amd64"
      sha256 "8890cdd7c1f2d195f07df3922396bd165ca9cf494e706a71512d04e48af8a5c4"
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
