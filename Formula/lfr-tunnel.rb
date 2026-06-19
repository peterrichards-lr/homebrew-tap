class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.13/lfr-tunnel-darwin-arm64"
      sha256 "240661f8e48915c33a2341751a6057780f31739fd94917acf515b3f4ba784d7c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.13/lfr-tunnel-darwin-amd64"
      sha256 "72b7f4ddd32621e166951cfb10251d513001f8dc03e537bf4985ffb5e25790a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.13/lfr-tunnel-linux-arm64"
      sha256 "9c7b370c3cc3c69fc7cccdc781c9e43aa75ee6c6292d3e0377338725193363d3"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.13/lfr-tunnel-linux-amd64"
      sha256 "d84a99b6d98e8246782a58b4fcb62619f46e9cf4dc986249b3848eee87fa59e7"
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
