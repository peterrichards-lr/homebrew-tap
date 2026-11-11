class Lwu < Formula
  desc "A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version"
  homepage "https://github.com/peterrichards-lr/liferay-workspace-updater"
  url "https://github.com/peterrichards-lr/liferay-workspace-updater/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "a446bd6ac8ffd0a6cb08c1a475c87ec0b099bfb571d8d006cc28e97b1177c6de"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lwu", "--help"
  end
end
