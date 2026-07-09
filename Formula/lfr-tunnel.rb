class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.0/lfr-tunnel-darwin-arm64"
      sha256 "829016eedef8ef92de188bdc3170f1ddb494da60764f83db6f6555f33337a86d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.0/lfr-tunnel-darwin-amd64"
      sha256 "4fb021fc5119d82f76af82231e81ddc023560f60adb6ae1f5925fb6f53de2904"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.0/lfr-tunnel-linux-arm64"
      sha256 "7b13fa70e2bcc55c6c598d2c67d799c788801de594e0dc05df7d56edda6cdac6"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.0/lfr-tunnel-linux-amd64"
      sha256 "7dba457611d4f27b6b7ef7b4243cbf938b8adf99c88b4e6597b80f2084daae53"
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
