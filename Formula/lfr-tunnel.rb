class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.50"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.50/lfr-tunnel-darwin-arm64"
      sha256 "387229099cf2e8ab37d080595590e0d18cdec904c2508cebd46ca4b4b4091821"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.50/lfr-tunnel-darwin-amd64"
      sha256 "2778da277ed52923e0d18ae4c83a8ef6e7275f79b13df27bf98609249e4cca03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.50/lfr-tunnel-linux-arm64"
      sha256 "a077295df1db77eb2e06b87a79a8b6e8b9f25800e339d47cbf8f6b123274e512"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.50/lfr-tunnel-linux-amd64"
      sha256 "01cd957d21e463c5271957cadc94c46e96370c47c3b15b73105c32520091c46e"
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
