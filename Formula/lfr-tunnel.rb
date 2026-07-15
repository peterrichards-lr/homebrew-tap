class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.31.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.5/lfr-tunnel-darwin-arm64"
      sha256 "dd72c747bebaf1d51f7f5656ec9998e9244d1156e8662d3c00f64627d9220a76"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.5/lfr-tunnel-darwin-amd64"
      sha256 "850ec9a8e487c66c11db0a4863a145d467bf324b3d0be9e158f9a332995b5470"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.5/lfr-tunnel-linux-arm64"
      sha256 "a331897538315483d94f77254e929c154d2269ca81da79a13c526e2fc6d114a1"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.31.5/lfr-tunnel-linux-amd64"
      sha256 "39c51dc62d67ab010fa1a0edea6af096a27df499756025eb34ab14e039214dcf"
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
