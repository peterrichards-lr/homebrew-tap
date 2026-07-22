class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.14/lfr-tunnel-darwin-arm64"
      sha256 "6793ca18d93eed340770f813d6acc7ce7c786ec3bd07cddce5c28a75c995dbd4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.14/lfr-tunnel-darwin-amd64"
      sha256 "01c647e7556a25f8fe862eac8f4354f2f82c551b64ddcc5b85a0e9b7c8823a0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.14/lfr-tunnel-linux-arm64"
      sha256 "246ebb94f493db16046bedd16eaf6579e786075b2111fe3a9e3068d648b0bedc"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.14/lfr-tunnel-linux-amd64"
      sha256 "be67be056ece108020da7189bfd8911ee021314eb477f5a9e05a7d7bf602932d"
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
