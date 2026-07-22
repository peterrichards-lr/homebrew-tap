class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.6/lfr-tunnel-darwin-arm64"
      sha256 "5bf98faf4757fd3c344e8b483e2c66dc9c4411ecd9123ec7ec598dea27dedde6"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.6/lfr-tunnel-darwin-amd64"
      sha256 "525433e3d4eb3115efa079d112440433cceb015ad6ae82fc5b470840e8ac93cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.6/lfr-tunnel-linux-arm64"
      sha256 "4a7e8ad11164ec4a56873a3fc3a657011df3a2af67d145e043494f20383a2a98"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.6/lfr-tunnel-linux-amd64"
      sha256 "ac4ce4cc79754a92057d11e0e0772cbd5a00471c7b630618d773a55ae3ed386b"
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
