class LfrMockGen < Formula
  desc "Liferay Mock Content Generator - Blazing-fast CLI tool using Gemini AI to generate realistic mock Web Content"
  homepage "https://github.com/peterrichards-lr/lfr-mock-gen"
  url "https://github.com/peterrichards-lr/lfr-mock-gen/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "4cc6a905e0a3657d931a4db8628c8c415f30855b962c03c998ee2e9b0cfcfe5c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lfr-mock-gen --version")
  end
end
