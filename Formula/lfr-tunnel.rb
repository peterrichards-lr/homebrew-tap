class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.30.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.1/lfr-tunnel-darwin-arm64"
      sha256 "9fcd82d6b61a92530ddf2268ef480adb92c726a106b52af6bfcc8ca0300ca683"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.1/lfr-tunnel-darwin-amd64"
      sha256 "6dae3fde583ec69dbc55a00cb02093164813868db6e7ac249d9536c73e2f9920"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.1/lfr-tunnel-linux-arm64"
      sha256 "85182b265a3654b4abbee89dfb23faaca23be8ed893b4d8ecb3bf512310ae8e4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.1/lfr-tunnel-linux-amd64"
      sha256 "21c752faa70c832b11d485e69cd3b33aaf3a3290cd46a82ca414b142ab203d1c"
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
