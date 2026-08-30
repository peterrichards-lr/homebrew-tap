class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.10/lfr-tunnel-darwin-arm64"
      sha256 "3b38386842e716bdd540243dee93ca606ddbb402a17425b3cdecb30486ec2ec7"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.10/lfr-tunnel-darwin-amd64"
      sha256 "2565024e304fcecd0e3fdb63a991d595ca28e6d9171a3642325e1f1eb101bff4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.10/lfr-tunnel-linux-arm64"
      sha256 "9c55a1e365202cf5cd6b6d9795b5b7852a616998b1ac0a8514806dc2a6b8a3c9"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.10/lfr-tunnel-linux-amd64"
      sha256 "853f6bd936f7ecd912d55ae53a79ba741abd86b687a0b27561036bfcd78028d5"
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
