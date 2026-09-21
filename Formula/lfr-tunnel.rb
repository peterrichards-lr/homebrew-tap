class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.42"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.42/lfr-tunnel-darwin-arm64"
      sha256 "7838f62a4f76cc3f305a7a44bebb7b891380bf0c40d9e53253e12bce7e014e4a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.42/lfr-tunnel-darwin-amd64"
      sha256 "8bd5333d05910b259eaec00eea31d417e482e2a59ff5b6005648a420e214c054"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.42/lfr-tunnel-linux-arm64"
      sha256 "62f8b1e4b408164b00eb2c2659a13ab25aecac357f655288898e87999a990ea0"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.42/lfr-tunnel-linux-amd64"
      sha256 "7a25ad61541ad984f0f37e2e68899e0301288987238d409b7d4795ea2ba4b9b7"
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
