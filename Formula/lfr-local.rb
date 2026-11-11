class LfrLocal < Formula
  desc "Liferay Local Instance Manager - CLI tool for managing local side-by-side Liferay environments"
  homepage "https://github.com/peterrichards-lr/lfr-local"
  url "https://github.com/peterrichards-lr/lfr-local/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "0cee057cb5eb9693e0027a21f89142a39c5caa7aa3e082dadd6927750c567a70"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lfr-local", "--help"
  end
end
