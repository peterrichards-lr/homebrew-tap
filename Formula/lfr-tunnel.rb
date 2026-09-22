class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.48"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.48/lfr-tunnel-darwin-arm64"
      sha256 "496db5438c0e649690ee19ea75dc8869566b0fc9220aa86a2ef74773349b94fc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.48/lfr-tunnel-darwin-amd64"
      sha256 "523c7911a8649b5ef34bd43f8d4395642f5d8d5e76c8ffe7da36023fbdcc75a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.48/lfr-tunnel-linux-arm64"
      sha256 "038e1ab52eec67ac0088b031745c0ca5774c05880a57a25bddafc2b2d297c985"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.48/lfr-tunnel-linux-amd64"
      sha256 "d8fb99cabcbe26ec4c9eefe4c02f4a4d5bede1f10154e244bbf0f4502c4364f6"
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
