class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.52.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.4/lfr-tunnel-darwin-arm64"
      sha256 "3ee1be5ddb7fa1ab757dd90ccde05ec6efe2b9cd6f2a3b041d553c9c980ef39d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.4/lfr-tunnel-darwin-amd64"
      sha256 "4af1f5baa86213d18fbef5ad5ea1a0324fcdaa21d471051e2d03722a04700bbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.4/lfr-tunnel-linux-arm64"
      sha256 "e7392834c6694db76430c395638ba86802664aa2cd3309e4ab40e19d4fab5cce"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.52.4/lfr-tunnel-linux-amd64"
      sha256 "c604ebfba0769477ba5fd4078b38fd311259ce8a500ef5b52a6d26858c01a951"
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
