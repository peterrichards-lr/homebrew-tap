class LcpSvcUpdate < Formula
  desc "Liferay Services Updater - Update Liferay Cloud service Docker image references (LCP.json)"
  homepage "https://github.com/peterrichards-lr/lcp-svc-update"
  url "https://github.com/peterrichards-lr/lcp-svc-update/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d730bb3867d1a9b39b244bdabee85359dca1375943c6b661e4f6c346ec57bc58"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lcp-svc-update --version")
  end
end
