class LcpDbReset < Formula
  desc "A Liferay Cloud utility to reset the database schema."
  homepage "https://github.com/peterrichards-lr/lcp-db-reset"
  url "https://github.com/peterrichards-lr/lcp-db-reset/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "e6d917321e4e4863b61371303fb7f8ab4555aef307f1cf7447667834a6b24f99"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lcp-db-reset", "--help"
  end
end
