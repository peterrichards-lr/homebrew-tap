class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.10/lfr-tunnel-darwin-arm64"
      sha256 "40b974ddd950b472aed4a0c4c01ea11240fa4d75c8608fd99be3144bb19894b8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.10/lfr-tunnel-darwin-amd64"
      sha256 "f98618e9df7afaa09c9edf871d97e8e5d8e6b5994ab38211b1ea28809d653989"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.10/lfr-tunnel-linux-arm64"
      sha256 "6df530d258f794535016e6505fda43ba1067e6524816a77db3fe42ea94757511"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.10/lfr-tunnel-linux-amd64"
      sha256 "c818a3bc713bbe365d630a24b2c3481cc3492bbb86ce44401ac4a30edac98fda"
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
