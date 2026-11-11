class LcpSqlFetch < Formula
  desc "A tool that executes local SQL scripts on a Liferay Cloud database via lcp shell and downloads the results."
  homepage "https://github.com/peterrichards-lr/lcp-sql-fetch"
  url "https://github.com/peterrichards-lr/lcp-sql-fetch/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "d72510b7b27d37a32bd9c10611e6caff23fb441c107d7a49c1392a482f7271ab"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lcp-sql-fetch", "--help"
  end
end
