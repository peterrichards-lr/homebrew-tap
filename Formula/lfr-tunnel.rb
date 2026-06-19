class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.10/lfr-tunnel-darwin-arm64"
      sha256 "e979edffb6b72cbffbc33f8706305472b92af2f14d44c34e26a24b332f880aa2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.10/lfr-tunnel-darwin-amd64"
      sha256 "6d4aef719dee798e611139e422d9231b226ec3538617d025fad08accf8fc63d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.10/lfr-tunnel-linux-arm64"
      sha256 "9c7fa1a9ea229713c66260bcc77f06e6a8fd89c02583a30f5ab81af0e6d4b99c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.10/lfr-tunnel-linux-amd64"
      sha256 "86c68486bf8c0597ccd5256248b10b42e8400fdef885be84fa84af50ec94afc5"
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
