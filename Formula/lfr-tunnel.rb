class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.44.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.5/lfr-tunnel-darwin-arm64"
      sha256 "e52ce4bb1a24d15a18e623914f1c7490cb122ff118770aa52a3987f38c50f82e"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.5/lfr-tunnel-darwin-amd64"
      sha256 "e9aa51e484db1847771f119b0d06d3d857f2fb588e7ff0f584866ee8da55cdc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.5/lfr-tunnel-linux-arm64"
      sha256 "78b6b104c74bc7eb30c58f547c11756194e57103d6a0b420aab357cb518ffd69"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.44.5/lfr-tunnel-linux-amd64"
      sha256 "571cdfa11e96b8c0bbbea570730b8daf0167d45f9e3fd52c0f694f7bb373f77a"
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
