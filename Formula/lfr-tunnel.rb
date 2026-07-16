class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.39.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.3/lfr-tunnel-darwin-arm64"
      sha256 "6dab34e9a68d049302956460c54bd63e8b4f4b5442aa006299828a2f652ba296"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.3/lfr-tunnel-darwin-amd64"
      sha256 "e26de531a0c62f8faf3c0b74621569b9baf80f98394a8436d1f7dfcfc40a219c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.3/lfr-tunnel-linux-arm64"
      sha256 "dc9ff7d9ffb5542fd081face03ec98982651068a67abc6b825fbbb83f119cea0"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.39.3/lfr-tunnel-linux-amd64"
      sha256 "16da1c21f59adccdcd4bc495f228016193eb83260037bcbbadf0ef4b3fe74835"
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
