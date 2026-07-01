class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.27.0/lfr-tunnel-darwin-arm64"
      sha256 "c898423eb60a3853a6dc29c044e784e34e82227cb31c791774f1c7c6cb93d8c5"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.27.0/lfr-tunnel-darwin-amd64"
      sha256 "9eceee59f33b45d4035d00c6c02d9b80144f20cbc787421691c30535f09eb7a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.27.0/lfr-tunnel-linux-arm64"
      sha256 "2985fc45b025f457741b99a9c0c63c26edb0388cbbf85b179e01e426ac3deccf"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.27.0/lfr-tunnel-linux-amd64"
      sha256 "07d5c0b267ddb00fbc7e0ff2c5b911d37bc5b3e0d2ebc4fc00b0f7b9d7a8b8a3"
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
