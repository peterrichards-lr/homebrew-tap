class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.45"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.45/lfr-tunnel-darwin-arm64"
      sha256 "badf2ee419b503829c92c44dafcabe2e86d8d7d53948a2b2cb3bbcc81687fcae"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.45/lfr-tunnel-darwin-amd64"
      sha256 "dc97922f64936452fa2d0ff504865ae103c6cb872570c768871e0d4c3053d59c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.45/lfr-tunnel-linux-arm64"
      sha256 "9559c49a821e33ad5aa225f8f6deda773f3da19115de667c4fdf68e3898ae473"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.45/lfr-tunnel-linux-amd64"
      sha256 "35b66bb9df8f2f737706238ce8c90553001d99f4b4ce775e024aa7b273ef8b6c"
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
