class LfrMockGen < Formula
  desc "Liferay Mock Content Generator - Blazing-fast CLI tool using Gemini AI to generate realistic mock Web Content"
  homepage "https://github.com/peterrichards-lr/lfr-mock-gen"
  url "https://github.com/peterrichards-lr/lfr-mock-gen/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "12c3ab62ff21237846183f79590e853f3f1a01b47f0f355585711d932103e97e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lfr-mock-gen --version")
  end
end
