class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.4/lfr-tunnel-darwin-arm64"
      sha256 "c58665815225a615f850fc23c57d0405e3d7055e6d191975dd37754aec6ed301"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.4/lfr-tunnel-darwin-amd64"
      sha256 "ab101e8e91e1372464784e8e6660f7d4d433cc9b79ee35a26b69f30a4872f77d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.4/lfr-tunnel-linux-arm64"
      sha256 "1ac0f6e0230a75d46e1ed1e517f6eca9079aef11ca4cf6703320e0fba8a9cb9b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.4/lfr-tunnel-linux-amd64"
      sha256 "6f8d65892067e52e03fe9b14ecddb68c5055d600da539d97746bf64f29fac9aa"
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
