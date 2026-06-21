class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.6/lfr-tunnel-darwin-arm64"
      sha256 "bb6668456f09d5b629df0effc80acff1b05cc345436b5df77ea13b4aa1106a4d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.6/lfr-tunnel-darwin-amd64"
      sha256 "a30b404cd027b96027dda294e6da28663fe9cbb95f7c92eca5461f4c7d137498"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.6/lfr-tunnel-linux-arm64"
      sha256 "485fc5a12671b360ed3742e44736fa877405b69d9894a7a4cc3dd6971ea2bce2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.6/lfr-tunnel-linux-amd64"
      sha256 "c8b3f5e55c8861607b0bbed8f8923a53ce3cc923643ab08b56361875fc817b0f"
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
