class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.43"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.43/lfr-tunnel-darwin-arm64"
      sha256 "08921cea0e75377f5a5ccc54ed58e9a39a51a3abeeab0809819aaec22f6ad331"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.43/lfr-tunnel-darwin-amd64"
      sha256 "5199b01c301a8514c118d5e4708c5652e95e61b06e18a6a5e8a75293f3cf5ed3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.43/lfr-tunnel-linux-arm64"
      sha256 "616fb9233841abfef41bb5a06350ff59db11298f6a46c1286e6fa1ff66143356"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.43/lfr-tunnel-linux-amd64"
      sha256 "f53bfc39fb772964e8aec8e879d05536c8b3e8177492c6550d0a06e0d2dd5b80"
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
