class LfrLocal < Formula
  desc "Liferay Local Instance Manager - CLI tool for managing local side-by-side Liferay environments"
  homepage "https://github.com/peterrichards-lr/lfr-local"
  url "https://github.com/peterrichards-lr/lfr-local/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fbf6cc9c421f12dc12d853ed57f3f334e008564b64f3c75a6920e874d51dc1d1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lfr-local", "--help"
  end
end
