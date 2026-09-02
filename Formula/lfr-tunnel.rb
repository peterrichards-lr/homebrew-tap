class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.22/lfr-tunnel-darwin-arm64"
      sha256 "fba1fb1ca248dae0ee0860a2ab6f45f6a4ff030e3ab727362c7b8fc28ad7265d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.22/lfr-tunnel-darwin-amd64"
      sha256 "e27efadacc0a3f2ea86019a97c6611392f28da822ec05f6198b40af4365e53b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.22/lfr-tunnel-linux-arm64"
      sha256 "c592f53b66c966763107d80e27e1a62d2486cf36d5a48d15e012dca219c8a45e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.22/lfr-tunnel-linux-amd64"
      sha256 "63c3272f28b7d8f6a1f58b40bd0b35b0b6214d9f38f304d293ca74569d4fc505"
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
