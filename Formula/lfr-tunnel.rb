class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.19/lfr-tunnel-darwin-arm64"
      sha256 "bfcaf06ae4e60cb729446c6a247c1cfb55466955900fe6ab6fefb67406df078e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.19/lfr-tunnel-darwin-amd64"
      sha256 "282a1f53b28057af9299eb0889f1e182ac5f481616ddf5f762640f2df9054bfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.19/lfr-tunnel-linux-arm64"
      sha256 "49bd158a37211df1eb008342971b08bf7d87e88e250d02d9472016390cfdd05d"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.19/lfr-tunnel-linux-amd64"
      sha256 "53ffbd727b8bff812a29c7730c603ab4fe557b9d7ab3cddb18d3b868d9325c1c"
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
