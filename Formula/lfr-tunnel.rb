class LfrTunnel < Formula
  desc "Secure HTTPS tunnel client for Liferay Sales Engineering team"
  homepage "https://github.com/peterrichards-lr/lfr-tunnel"
  version "1.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.2/lfr-tunnel-darwin-arm64"
      sha256 "aa1977339cd079421c8709217c13a41464ea58920881620603c4203a43429ce4"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.2/lfr-tunnel-darwin-amd64"
      sha256 "5464cdb8e8ad8231ebd6219ad3d88d5930e186cb51cd8df0370f548ce348755f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.2/lfr-tunnel-linux-arm64"
      sha256 "c243aea6a79e8f561971b5220cfec343e7aba91be78f6ad63b7b96ec5cc10c5a"
    end
    on_intel do
      url "https://github.com/peterrichards-lr/lfr-tunnel/releases/download/v1.14.2/lfr-tunnel-linux-amd64"
      sha256 "8f91b0010bc2d740b14a6d69014e128ea0f0954c7acbd8e88810e28cc3825024"
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
