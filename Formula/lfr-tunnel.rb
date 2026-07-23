class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.1/lfr-tunnel-darwin-arm64"
      sha256 "82b65ee540156051ea368102a7451915a17ff47af1047f5490516238a97efa4a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.1/lfr-tunnel-darwin-amd64"
      sha256 "6a496d0fdf3558b2f681521021bc680d199022340ce553fc4cfa6c4c0248aafb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.1/lfr-tunnel-linux-arm64"
      sha256 "2c771d17c03b13b7787763674a4332820b1583bb58d6b9c583f0d1c19ff64007"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.1/lfr-tunnel-linux-amd64"
      sha256 "fc10310d6fbaf2401578a870affb76d67c4801652055b8fabcfd74026d51b6eb"
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
