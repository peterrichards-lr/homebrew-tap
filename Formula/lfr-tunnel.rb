class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.43.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.10/lfr-tunnel-darwin-arm64"
      sha256 "f9bc32dc817b52bf6343a3bbe69ef07f77f3fc5adf8454e1b5591de5da158058"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.10/lfr-tunnel-darwin-amd64"
      sha256 "d7487bfcd22463c3ff9c814fcd9c1cf73d7929a4c4814b3a897d51e56edf5a57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.10/lfr-tunnel-linux-arm64"
      sha256 "2ef823177386648435fca249d6d46cc6c237f607f8e2f59d2847d45830475f6a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.43.10/lfr-tunnel-linux-amd64"
      sha256 "8928dc9f5d0dbb1e4342edff86394be449dd72a30ceb26343eea50c33ce42b4c"
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
