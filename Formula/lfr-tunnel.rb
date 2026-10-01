class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.51.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.1/lfr-tunnel-darwin-arm64"
      sha256 "d3997162fa34ab7affdaba81a4b72d1a5b087c6ef00dbdfc531b43ebeba97360"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.1/lfr-tunnel-darwin-amd64"
      sha256 "0651f9b7d757fa0adfe33ce110ad610381247be9384fc4e873eaf39722a45439"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.1/lfr-tunnel-linux-arm64"
      sha256 "721201b8bff6c51cda9dd5c0b3904d464d37ef810eec875c9a5b8d09db015e03"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.51.1/lfr-tunnel-linux-amd64"
      sha256 "a5005eb200c89a49caa4f8a9253efe0e6c59123c6c6ee1fc3a9bbb57abf4bc8c"
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
