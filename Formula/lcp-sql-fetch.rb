class LcpSqlFetch < Formula
  desc "A tool that executes local SQL scripts on a Liferay Cloud database via lcp shell and downloads the results."
  homepage "https://github.com/peterrichards-lr/lcp-sql-fetch"
  url "https://github.com/peterrichards-lr/lcp-sql-fetch/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "5e3fa15fa0a6cf8866b506c0acad901bcdc64b7148260a255aab8f60f5119cd9"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lcp-sql-fetch", "--help"
  end
end
