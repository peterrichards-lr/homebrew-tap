class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.18.0/lfr-tunnel-darwin-arm64"
      sha256 "023ba951b22cd8f533ead042bb1392a0def039520c8bab80a3679f3100fc8095"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.18.0/lfr-tunnel-darwin-amd64"
      sha256 "cbb54602a43b4d2873e0b76092b55b97e56ff82e84216a50efcecf5cdacd86b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.18.0/lfr-tunnel-linux-arm64"
      sha256 "770d860eb0a230ec47fe84f2428b2700f731e9c87d3249256b7b8d4bd90a8d42"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.18.0/lfr-tunnel-linux-amd64"
      sha256 "5dc0884cfba570a5890ea2226bf6a7c8898692a6afa8126ec75999b57392850f"
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
