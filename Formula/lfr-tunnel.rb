class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.24/lfr-tunnel-darwin-arm64"
      sha256 "7f395c6b8561e0dfca1219a404289527f542b6804ae257fc16d78492d35bdc28"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.24/lfr-tunnel-darwin-amd64"
      sha256 "4924ea3088810e649b4eee8ee41907589ac92ae4980189bbfdcb35feeaebfa99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.24/lfr-tunnel-linux-arm64"
      sha256 "5dd8ba10f86b0a0e0c62179ff6dd8eacbf4364bb13b9069b99fb6d44330f2075"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.24/lfr-tunnel-linux-amd64"
      sha256 "4c8457571cfab80c254ec0364b65a158e05f014db0337f6c3adae2ce1565e7a8"
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
