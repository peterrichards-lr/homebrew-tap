class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.50.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.50.0/lfr-tunnel-darwin-arm64"
      sha256 "10f14c4c5a29aa659b41040f0f4c11ac68640c2e14014dbbd61ed10536a2f0ae"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.50.0/lfr-tunnel-darwin-amd64"
      sha256 "b89e5f987b2c2cb0705c982e750b2776f267196f60a437c4dfdf6eac694f100a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.50.0/lfr-tunnel-linux-arm64"
      sha256 "c11f0ba11be22b7876c1a16bdbc4da746bc53ce2502b0981d3e168304f4e1b5a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.50.0/lfr-tunnel-linux-amd64"
      sha256 "d75e606e9ae2fcac08d20737ff666d56deb0c055bd75cb669b55d598527a0e5b"
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
