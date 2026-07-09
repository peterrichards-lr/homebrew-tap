class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.30.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.2/lfr-tunnel-darwin-arm64"
      sha256 "40a9628903dab59d359ae594e6ded854b64f9b431441215eb21014eead1dff7e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.2/lfr-tunnel-darwin-amd64"
      sha256 "4f17365423149593ae31475da5a60e840429fc51bacc549f9f622de6897acb6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.2/lfr-tunnel-linux-arm64"
      sha256 "664e67ebf20a293796b909fa990115ea804f569214e81868235e70e163bbedd9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.30.2/lfr-tunnel-linux-amd64"
      sha256 "f619a0464033b3bd3d70a4e605c122acbee90c6dd93482d99c28a2d1145a05db"
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
