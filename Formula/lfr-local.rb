class LfrLocal < Formula
  desc "Liferay Local Instance Manager - CLI tool for managing local side-by-side Liferay environments"
  homepage "https://github.com/peterrichards-lr/lfr-local"
  url "https://github.com/peterrichards-lr/lfr-local/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "654ccb29b4edba65050b0cf57c770e69c703f8f16c1c530f2ae46b6a666b9c5a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lfr-local", "--help"
  end
end
