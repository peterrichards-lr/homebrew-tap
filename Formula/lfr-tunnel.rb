class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.13/lfr-tunnel-darwin-arm64"
      sha256 "76cf7619346a7d19b653dcd2a1163cb0856f48a751f148c8269fe2547bfd9acf"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.13/lfr-tunnel-darwin-amd64"
      sha256 "1c5b78a51c62c6878e63054216df77818fb73132c13347adb4416f7116010c45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.13/lfr-tunnel-linux-arm64"
      sha256 "81499792c4704ce62477375a0b545c74048a9943b5f88e009f25efe3c03e0b0e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.13/lfr-tunnel-linux-amd64"
      sha256 "e98c28e08f92176fe39e6330afc43de342d3326e6430569f563e525293e80698"
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
