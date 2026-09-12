class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.28"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.28/lfr-tunnel-darwin-arm64"
      sha256 "7c6c1f8f25748c2017e223df916863a862eb613e0962c4bbe0300326b0539ef9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.28/lfr-tunnel-darwin-amd64"
      sha256 "16565ce2ba34b35eda8c61fed3a03bdf3a764842401df81fb6c45cafabba5c09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.28/lfr-tunnel-linux-arm64"
      sha256 "bad83f0a1f5203ff897795f764eaa19d2d78244c487f0bbe25dbadb3c5078d38"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.28/lfr-tunnel-linux-amd64"
      sha256 "0caa52948886840bd58716e4da5cf8f8c8fa5fb5370116eca51a46ca1818b014"
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
