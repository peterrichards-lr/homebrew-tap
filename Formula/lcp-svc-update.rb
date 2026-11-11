class LcpSvcUpdate < Formula
  desc "Liferay Services Updater - Update Liferay Cloud service Docker image references (LCP.json)"
  homepage "https://github.com/peterrichards-lr/lcp-svc-update"
  url "https://github.com/peterrichards-lr/lcp-svc-update/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "529dd528f1b7fd01a6ee5d97a06ac1720e866318623b9d7263d433f3e858e4f1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lcp-svc-update --version")
  end
end
