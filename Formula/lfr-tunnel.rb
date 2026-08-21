class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.47.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.47.0/lfr-tunnel-darwin-arm64"
      sha256 "d6f995342f27927ac2766b8ba5afbbd541a854222c097397eb07aaf276fbe352"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.47.0/lfr-tunnel-darwin-amd64"
      sha256 "36809f93461e5f10b072ccb8f57ed5e53d4c653c76dc1eb2168614a4b605a683"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.47.0/lfr-tunnel-linux-arm64"
      sha256 "2a14c9eee9e606e1e74c971358ffac1036189fd4bca97177d24b6d9590a2d9be"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.47.0/lfr-tunnel-linux-amd64"
      sha256 "a92e15b5dd3ba4bfa1c9279f761c9e9b13b539a512b48c22f40b682a4e6b51a2"
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
