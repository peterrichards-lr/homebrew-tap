class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.3/lfr-tunnel-darwin-arm64"
      sha256 "b34dd33ae8444235dd454380a1c94d8e5ba710b5ea767f49c806cd39e5a4eaf7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.3/lfr-tunnel-darwin-amd64"
      sha256 "45ee02c95e6c450517d0c26b2eaa1492b110379e2301562bf431ac5eb5d67bdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.3/lfr-tunnel-linux-arm64"
      sha256 "02a97d3a2220e71464d3e292f8f98305eedcd27230223c8165d83b641d9a449a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.3/lfr-tunnel-linux-amd64"
      sha256 "2957c282ef312619413624750cfac9a79f6b974a88e054ff47d14574d5254457"
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
