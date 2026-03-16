class LcpSqlFetch < Formula
  desc "A tool that executes local SQL scripts on a Liferay Cloud database via lcp shell and downloads the results."
  homepage "https://github.com/peterrichards-lr/lcp-sql-fetch"
  url "https://github.com/peterrichards-lr/lcp-sql-fetch/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "905a3e2eb854317f1654051bd6c7536219fc2689aba0aefe7931757c7f365d44"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lcp-sql-fetch", "--help"
  end
end
