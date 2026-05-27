class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7ca84abbd73956ce4af4fbd393704a01f0531366d3eba28024b046f0a8309639"
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
    assert_equal "1.0.0", shell_output("#{bin}/polish --version").strip
  end
end
