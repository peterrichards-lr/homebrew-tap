class LfrMockGen < Formula
  desc "Liferay Mock Content Generator - Blazing-fast CLI tool using Gemini AI to generate mock content"
  homepage "https://github.com/peterrichards-lr/lfr-mock-gen"
  url "https://github.com/peterrichards-lr/lfr-mock-gen/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2413615ce766a9c4abf0bfa7c3ea3bb903160e83573ab609b51453ee912c0b1d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lfr-mock-gen", "--help"
  end
end
