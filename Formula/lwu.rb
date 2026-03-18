class Lwu < Formula
  desc "A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version"
  homepage "https://github.com/peterrichards-lr/automatic-potato"
  url "https://github.com/peterrichards-lr/automatic-potato/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bbb4ae97b6da0e4d2f51a4a3aedf0af116f070e2cc214ee1be82e23cebd9a4f5"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lwu", "--help"
  end
end
