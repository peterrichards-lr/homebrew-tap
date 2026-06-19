class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.8/lfr-tunnel-darwin-arm64"
      sha256 "5dbe11b93529b41638f600681cc3d83d86e8900146468c4690bd77af80641682"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.8/lfr-tunnel-darwin-amd64"
      sha256 "ff153bbf88f243bf953ad842fa60a998fcb1ad48338e8f30790f6846e195c9b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.8/lfr-tunnel-linux-arm64"
      sha256 "79c88ec58a47d73401ec279b5912e76cd05584a079c2433c4b8019bf17f85272"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.8/lfr-tunnel-linux-amd64"
      sha256 "3b91081354a41a5960ef45c0063f984dd0f29675df1049468ce1343d6cb7b50c"
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
