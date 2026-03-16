class LcpSqlFetch < Formula
  desc "A tool that executes local SQL scripts on a Liferay Cloud database via lcp shell and downloads the results."
  homepage "https://github.com/peterrichards-lr/lcp-sql-fetch"
  url "https://github.com/peterrichards-lr/lcp-sql-fetch/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f51726f6579bccbe10963fa816250cd0b9eab712b71844e36fdbe93b15603f40"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lcp-sql-fetch", "--help"
  end
end
