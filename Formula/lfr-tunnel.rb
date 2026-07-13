class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.31.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.1/lfr-tunnel-darwin-arm64"
      sha256 "cc2cca7dd5b2b5edb6bb245bf280c716dc5e0a5287c22603aad48dfa6c17c7f8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.1/lfr-tunnel-darwin-amd64"
      sha256 "41b13740860bc1902517762320e95c7f52409f1ddf32d72f88c1ee5c6732bceb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.1/lfr-tunnel-linux-arm64"
      sha256 "8faf6cf36e872009c75d528a18738a16586655fb762d099edfad5ca07db6671d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.1/lfr-tunnel-linux-amd64"
      sha256 "ef775222f90674c84cc3468d5bfc2660afd0b8d514b3eb8db46000bfe93b411d"
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
