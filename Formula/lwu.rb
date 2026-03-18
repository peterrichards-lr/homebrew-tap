class Lwu < Formula
  desc "A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version"
  homepage "https://github.com/peterrichards-lr/liferay-workspace-updater"
  url "https://github.com/peterrichards-lr/liferay-workspace-updater/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "5ead9aa9a2ccbb1a5e972ea22b2257944899f9699c0c005863ed6924585934f5"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lwu", "--help"
  end
end
