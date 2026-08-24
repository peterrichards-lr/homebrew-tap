class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.4/lfr-tunnel-darwin-arm64"
      sha256 "5ad86fa3aac2580ab4a6c4a84717025de506a2cc0b4fb727b719c8c1bfe0fd58"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.4/lfr-tunnel-darwin-amd64"
      sha256 "bf16a4d7b02f0334d72d45e24e38b379ea509b9b9b2b890e3c3af188afa0a2f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.4/lfr-tunnel-linux-arm64"
      sha256 "bf31a26296611ed38e56dab9d6cfa898a228801a20edafe55a4d5ae4d121429d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.4/lfr-tunnel-linux-amd64"
      sha256 "2e16ce4d4a91a1175356d6af03693e6e34bab37560b19e6f3b6cd0b353ec7b98"
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
