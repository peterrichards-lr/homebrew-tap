class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.37.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.4/lfr-tunnel-darwin-arm64"
      sha256 "7bd7a335a8d7e1fded10425b235349bcffe5772b435a7d1de6b6858e4c8a9374"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.4/lfr-tunnel-darwin-amd64"
      sha256 "60bada4d9bf609f609a73bfccfaffa28ec2376ba62ff3f98047b4ef976258de4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.4/lfr-tunnel-linux-arm64"
      sha256 "4a0855335348626dbee081de1973e19bd99463f90f7ea55ac9bed2584080486f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.37.4/lfr-tunnel-linux-amd64"
      sha256 "c59e8b04c868260d8a8ced885ab313a287298ea71654576cc5c39e284cc40879"
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
