class Lwu < Formula
  desc "A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version"
  homepage "https://github.com/peterrichards-lr/liferay-workspace-updater"
  url "https://github.com/peterrichards-lr/liferay-workspace-updater/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "aaf1f1566f76057b6ebeafd9dd0cc491d076f1c2d85caad7766578d294982275"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lwu", "--help"
  end
end
