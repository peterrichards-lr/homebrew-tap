class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.23.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.2/lfr-tunnel-darwin-arm64"
      sha256 "dabd16cf643e4c90d92aefa45d722373a765c726f8e618fcc4b6d23efcd439ea"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.2/lfr-tunnel-darwin-amd64"
      sha256 "c40828353f0717e46b5de3942195cb1bc9301f151035619354a076b5b83fb8d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.2/lfr-tunnel-linux-arm64"
      sha256 "3b7e80671433e653179449789c8422de891614a472337300f2840e1f8572dec9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.23.2/lfr-tunnel-linux-amd64"
      sha256 "6ad6d34cc5a82a24cc3457cec1170591c17ec5330d658396f62e452658bae175"
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
