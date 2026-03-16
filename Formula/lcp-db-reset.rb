class LcpDbReset < Formula
  desc "A Liferay Cloud utility to reset the database schema."
  homepage "https://github.com/peterrichards-lr/lcp-db-reset"
  url "https://github.com/peterrichards-lr/lcp-db-reset/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c39562ea41d208e8d09b2a227c2e68c4949db774e3ed391c19bd8ad10a91de65"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lcp-db-reset", "--help"
  end
end
