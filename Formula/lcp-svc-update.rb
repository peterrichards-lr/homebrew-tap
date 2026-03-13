class LcpSvcUpdate < Formula
  desc "Liferay Services Updater - Automated CLI tool to update Liferay Cloud service images"
  homepage "https://github.com/peterrichards-lr/lcp-svc-update"
  url "https://github.com/peterrichards-lr/lcp-svc-update/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3aa3caafde94e2218555c52e2a211ffba5e886713665f688188a8f3b61f02786"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Check that the binary is installed and executable
    system "#{bin}/lcp-svc-update", "--help"
  end
end
