class LfrMockGen < Formula
  desc "Liferay Mock Content Generator - Blazing-fast CLI tool using Gemini AI to generate realistic mock Web Content"
  homepage "https://github.com/peterrichards-lr/lfr-mock-gen"
  url "https://github.com/peterrichards-lr/lfr-mock-gen/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "09e7684045f89def809dd4df496fe1c6731218be6cbebf5a565ae84590d06afb"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lfr-mock-gen --version")
  end
end
