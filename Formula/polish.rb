class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "108f9da744e08ec4567f2c7b2115d9ea68bf07da989983852203effcff46e71d"
  license "MIT"
  head "https://github.com/aresgott/polish.git", branch: "main"

  depends_on "node@22"

  def install
    system "npm", "ci", "--ignore-scripts"
    system "npm", "run", "build"
    libexec.install "dist", "node_modules", "package.json", ".npmrc"
    bin.install_symlink libexec/"dist/cli.js" => "polish"
  end

  test do
    assert_equal "1.0.2", shell_output("#{bin}/polish --version").strip
  end
end
