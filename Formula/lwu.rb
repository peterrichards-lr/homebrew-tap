class Lwu < Formula
  desc "A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version"
  homepage "https://github.com/peterrichards-lr/lwu"
  url "https://github.com/peterrichards-lr/lwu/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8d309f7196dda3763101e6a65681e312aa1169a4a736cee10c2d5dda654eb7c6"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lwu", "--help"
  end
end
