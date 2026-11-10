class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.6/lfr-tunnel-darwin-arm64"
      sha256 "3fbdc66e5ed9f6bcfd92f90ca640aabbb58468c51c6f8aed60090988900eb211"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.6/lfr-tunnel-darwin-amd64"
      sha256 "bb014937791420fd5122b6f0cda8f0522f337421a72e59e0bb2fbf3010e96897"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.6/lfr-tunnel-linux-arm64"
      sha256 "691060912573b98e76f727ed35d9d64baacf645447a6e047381af68757ec4602"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.6/lfr-tunnel-linux-amd64"
      sha256 "91d95e4712fa33fcccabacc716d2c3d2dbfa10d0fc5c90f4917f69a0bde5900d"
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
