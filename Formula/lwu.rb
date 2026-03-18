class Lwu < Formula
  desc "A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version"
  homepage "https://github.com/peterrichards-lr/liferay-workspace-updater"
  url "https://github.com/peterrichards-lr/liferay-workspace-updater/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ce325d97a4bfb498ed6f26d086448a39af56c1ddeaab8981bcbe5c720239b9a2"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lwu", "--help"
  end
end
