class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.7/lfr-tunnel-darwin-arm64"
      sha256 "fae1da37e404a544e65136ed9d337483313e198a081982faad52de6c2096e56a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.7/lfr-tunnel-darwin-amd64"
      sha256 "c38337ec670c530219ce57659b7c96aad4658044d0b894a789fec43efff3566b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.7/lfr-tunnel-linux-arm64"
      sha256 "1c30b9f9e0aca658e115f6b7ce92fa19ce0d187bea8f10d5662f68f373eb9ce7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.7/lfr-tunnel-linux-amd64"
      sha256 "9e68cd922d2d50d5a90b3870b9433d7fc61ac73867100c7efd61cef6c22b5657"
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
