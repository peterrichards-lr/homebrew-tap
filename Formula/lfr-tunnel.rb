class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.38.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.38.1/lfr-tunnel-darwin-arm64"
      sha256 "3b3c7c04cdc34cb434f9a4db1284cb96605be3b6828f6b1b32903e4cb56cbc8a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.38.1/lfr-tunnel-darwin-amd64"
      sha256 "0ff0d727a23dadabe2364273f987d0f96ad9bf722a475b881ff665a8713098aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.38.1/lfr-tunnel-linux-arm64"
      sha256 "c5d78f778dd4291a5f979fcf6242099897f17def11436ab268a34ac806e6ec6f"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.38.1/lfr-tunnel-linux-amd64"
      sha256 "2030283b359c77291ff0dbd5645e82106b80b7e7c6ab66365b541c9e321a0ec9"
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
