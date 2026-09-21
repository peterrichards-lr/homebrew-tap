class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.44/lfr-tunnel-darwin-arm64"
      sha256 "0a1b9fe60bbe5a96a94a6b345fb399181cf10b23b8c99f6c13413f327d56d607"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.44/lfr-tunnel-darwin-amd64"
      sha256 "ddcb8689c45a49e9bff95f60fb7c7ae778fe3532c5e78d1a5c70dbdcc76b07bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.44/lfr-tunnel-linux-arm64"
      sha256 "e8b5848ed7105f548b95ec0a77b1f06748912e3c9abb560f0c3ee77b799f60b4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.44/lfr-tunnel-linux-amd64"
      sha256 "cd4a7b4e75186d559a97523e77d072a13f22e8ea972e8ef86bb94d83560aeecd"
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
