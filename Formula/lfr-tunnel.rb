class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.48.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.29/lfr-tunnel-darwin-arm64"
      sha256 "d19153f26ba393801edb8da95f4645373e8ca8ea6dbe6fa32c6117387b62d755"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.29/lfr-tunnel-darwin-amd64"
      sha256 "4b072239170883b93dd9811afedd3a88dfd92308379036579a02cfb37c49f623"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.29/lfr-tunnel-linux-arm64"
      sha256 "a843c0bb316ec7b0e61b5830defb588f637c3ce8ca7a699edeb061947dc50d52"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.48.29/lfr-tunnel-linux-amd64"
      sha256 "dad32037a014d1120014d7a74795ee8fb433a1cd17999ed1f7d5ca0878355641"
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
