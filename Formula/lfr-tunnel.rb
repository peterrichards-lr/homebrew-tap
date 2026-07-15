class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.34.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.1/lfr-tunnel-darwin-arm64"
      sha256 "ad6387db3ae59ac3ef6e78259546dc54a36b335f893c0884e903b61e428205e8"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.1/lfr-tunnel-darwin-amd64"
      sha256 "49ee151f208ebf573c138fe9c1749a50d305f0843d513109395fed75e33ba67a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.1/lfr-tunnel-linux-arm64"
      sha256 "b7634b5369f2572463a0f37729edc8c6b01fe8f79036b13234b431e5b684eeb2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.1/lfr-tunnel-linux-amd64"
      sha256 "7dbfbd2018788628fe6ae5de3fbe4eaf283f40a7fcabd88a908615fb3a04b58e"
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
