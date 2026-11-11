class LfrLocal < Formula
  desc "Liferay Local Instance Manager - CLI tool for managing local side-by-side Liferay environments"
  homepage "https://github.com/peterrichards-lr/lfr-local"
  url "https://github.com/peterrichards-lr/lfr-local/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "4cd603bc7b293152e30378b69cb9280bf49ff0aad16a13f5338743e532e07680"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lfr-local", "--help"
  end
end
