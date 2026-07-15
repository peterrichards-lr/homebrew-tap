class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.34.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.3/lfr-tunnel-darwin-arm64"
      sha256 "cbfd66765107d9f7b02f4194e35859bc4053aec71a792b4367e5266647cb1c72"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.3/lfr-tunnel-darwin-amd64"
      sha256 "72b81dcef7122ff4b7fb81f81c016b2c95af1ea710c417d43e670eb58634526d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.3/lfr-tunnel-linux-arm64"
      sha256 "d27780342df28d862daf47a6e83c40f3973342389bcc6db7035faf1c906cea05"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.34.3/lfr-tunnel-linux-amd64"
      sha256 "42b3aab694bc6c3d3e7046d717649f098b2b9173c975c6c235ecda11cadf551c"
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
