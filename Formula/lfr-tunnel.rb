class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.7/lfr-tunnel-darwin-arm64"
      sha256 "7e0c2c573b71e998387c395cf665dc39f51399b379830986ef9bd3da7776dec6"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.7/lfr-tunnel-darwin-amd64"
      sha256 "7dcce086a03b8782685f2b5a3b94d58f2af63533496ef87be97fb81c7592c79f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.7/lfr-tunnel-linux-arm64"
      sha256 "224020b6cffa370757cd7ceed793d90e64afd306521dd5ec5dd87ed7d142b819"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.7/lfr-tunnel-linux-amd64"
      sha256 "877f14f9ed81420249305aeb49e740b24f38236d4d9cdba34c64cc4b245b0e83"
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
