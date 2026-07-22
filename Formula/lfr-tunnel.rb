class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.12/lfr-tunnel-darwin-arm64"
      sha256 "6b64281e3eee7ca90f1f9965d62dbd58cd56e7aaea878ad03ff8711d37647fc3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.12/lfr-tunnel-darwin-amd64"
      sha256 "431f5cbc819994ca34f48fcca1c6c35e20443d94520e3432c2ba799af80d6e6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.12/lfr-tunnel-linux-arm64"
      sha256 "43a0546801b742cacd85003aca03b332cd4a1bf2d70c6fef394e08799d472c4c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.12/lfr-tunnel-linux-amd64"
      sha256 "c8343298312a2a6bc8a8415c476a7b3aed6557ea7a7f0879d77fa931bb67b753"
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
