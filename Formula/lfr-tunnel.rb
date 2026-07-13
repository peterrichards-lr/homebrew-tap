class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.31.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.3/lfr-tunnel-darwin-arm64"
      sha256 "143bf2de15c8d450e1933a16c0a560d1e5ca57ca960992e68eeb2f1e6d37a514"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.3/lfr-tunnel-darwin-amd64"
      sha256 "fdad881add65cc02846068c2f72282361379cd6d32e2137854ed0ad620454a25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.3/lfr-tunnel-linux-arm64"
      sha256 "fea3bc640bd52d3d505035f8605ccd2800680f56da1db96f685fbb1630c16a09"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.3/lfr-tunnel-linux-amd64"
      sha256 "fc3d99d1babdc93b3ac631f12d3ce605decefcfe0f83b174d13d496ac8346311"
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
