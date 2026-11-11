class LcpDbReset < Formula
  desc "A Liferay Cloud utility to reset the database schema."
  homepage "https://github.com/peterrichards-lr/lcp-db-reset"
  url "https://github.com/peterrichards-lr/lcp-db-reset/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "096fa09c4d5e3f959c2f69104f7583c559e00400986824bfe0cc0913b399ba6a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lcp-db-reset", "--help"
  end
end
