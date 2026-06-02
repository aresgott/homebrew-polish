class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "04590ded42dea42645f98c553e05f4b16b0c824349514ba03d3c9f863ac8c464"
  license "MIT"
  head "https://github.com/aresgott/polish.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "ci", "--ignore-scripts"
    system "npm", "run", "build"
    libexec.install "dist", "node_modules", "package.json"
    bin.install_symlink libexec/"dist/cli.js" => "polish"
  end

  test do
    assert_equal "1.0.6", shell_output("#{bin}/polish --version").strip
  end
end
