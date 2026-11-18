class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.8/lfr-tunnel-darwin-arm64"
      sha256 "5608fdb7060c4cbfff01f81dbbd3c5a71d5ee26547f1fa00e589580d7fdb3aa2"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.8/lfr-tunnel-darwin-amd64"
      sha256 "48bce25e7dc98a05bf3b17f47b0e1dd7946f023ed1a8f9afb5e6f22f4f092fde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.8/lfr-tunnel-linux-arm64"
      sha256 "41b55e2f13e3fae1f7e67fb3c6f1467a72bdd0039535ec6541e898443c1e8a7c"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.8/lfr-tunnel-linux-amd64"
      sha256 "731047986ba205869912f9235af42fe31e6d8a6d81bafa9cbd755a5c2062e997"
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
