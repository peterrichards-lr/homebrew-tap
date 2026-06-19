class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.7.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.12/lfr-tunnel-darwin-arm64"
      sha256 "3769f8df9a2e88d02e684b2543d77b10eba3a1534c36da74f217864298e21e6b"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.12/lfr-tunnel-darwin-amd64"
      sha256 "932bbbda8abb511d885ac2f1a4e661023d664659a8d81da365ab8035c9254fe2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.12/lfr-tunnel-linux-arm64"
      sha256 "4b0081dc57cadb3242f696b6c126c25fd6f4f638544a1ce4426445950690e456"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.7.12/lfr-tunnel-linux-amd64"
      sha256 "9ba154f7deec425125ee22d46d29d1df1c511aae36c4a5c821d9cbe0057607ee"
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
