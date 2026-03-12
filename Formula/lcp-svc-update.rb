class LcpSvcUpdate < Formula
  desc "Liferay Services Updater - Automated CLI tool to update Liferay Cloud service images"
  homepage "https://github.com/peterrichards-lr/lcp-svc-update"
  url "https://github.com/peterrichards-lr/lcp-svc-update/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "8167c089585f9081415b9828cb04a09e3bd5c08f214b2d8c8ba598f8aa222b4f"
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
