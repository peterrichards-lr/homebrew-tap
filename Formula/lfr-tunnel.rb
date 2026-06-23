class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.13.0/lfr-tunnel-darwin-arm64"
      sha256 "a063db69b7418cc6f332f545150b479305aab867ca5140c9f03dbdbb5930b038"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.13.0/lfr-tunnel-darwin-amd64"
      sha256 "77a4072998ab8e78a058af5ee6fd0f96def5a83658909cd3dac79e4aa32ce266"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.13.0/lfr-tunnel-linux-arm64"
      sha256 "8b41f11b9d77952e169099b8cdd305cc4aaa569e7379db6a8aecbb09bffbff23"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.13.0/lfr-tunnel-linux-amd64"
      sha256 "d88d9d7714c2a016d153214549f04f2abf8474f92dff00a66644f05a72c97662"
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
