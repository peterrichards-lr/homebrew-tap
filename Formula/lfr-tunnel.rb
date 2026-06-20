class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.1/lfr-tunnel-darwin-arm64"
      sha256 "9d46a2fa07b280aa50de09c1a2fcad568f16931d11a6bbdf7b45943e5ae3eb83"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.1/lfr-tunnel-darwin-amd64"
      sha256 "0a49db0163c82ecb50ec9da00ca75f12b94d1a84c9f11d0a26af15402ae6814b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.1/lfr-tunnel-linux-arm64"
      sha256 "c761d85409c08f1c8b504eb9b2b73037a8aaeff461f2a4ecc612d7b2379d6368"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.9.1/lfr-tunnel-linux-amd64"
      sha256 "e9e8c9431892f728eeb3539e865ff8ad74b6670a10fe215e018f7832d72d2fb7"
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
