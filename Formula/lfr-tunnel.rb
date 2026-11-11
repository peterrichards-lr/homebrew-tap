class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.7/lfr-tunnel-darwin-arm64"
      sha256 "632399e701aaa0656910922c74eacdbe75aa6017a39f017207dd11e00f953355"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.7/lfr-tunnel-darwin-amd64"
      sha256 "9212f5af489be99c807b2527509cf99499a06a6865d9ce8b5f31953365d73675"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.7/lfr-tunnel-linux-arm64"
      sha256 "0a39f5168285edcf48960559f2719bb9749516f4860860f225da453012601ce3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.7/lfr-tunnel-linux-amd64"
      sha256 "89a3bfd46839f780d4fe60d9c0dfe499c405b6dd428807151714aa4b1cd60931"
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
