class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.22.1/lfr-tunnel-darwin-arm64"
      sha256 "6b59e514349bf0acd9ec53e6ae89cba2b168dd311b2dde8fcf7690955f62331d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.22.1/lfr-tunnel-darwin-amd64"
      sha256 "3457842615ccf1ff5d07ea3846cc1b46f69989acb852a121896f4ff57f03906d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.22.1/lfr-tunnel-linux-arm64"
      sha256 "50ea607ff10abf3926511875b19c4649752cd6217b5e36cf04201aaf025f58a6"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.22.1/lfr-tunnel-linux-amd64"
      sha256 "743e35869a58fe3dc39fe6c50c2892188326e940f2013a5982b9eee79fc2fa94"
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
