class Lwu < Formula
  desc "A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version"
  homepage "https://github.com/peterrichards-lr/liferay-workspace-updater"
  url "https://github.com/peterrichards-lr/liferay-workspace-updater/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "464ad955ff78b82ff7451b30d9fd42f4900f10a5a9a9e784a27149dbd4165550"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lwu", "--help"
  end
end
