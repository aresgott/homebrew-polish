class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "c3ddc8034f20ff1c65a1cf684610e4e33a1f020e9ea157d0e8bbb7783e2d5de6"
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
    assert_equal "1.0.4", shell_output("#{bin}/polish --version").strip
  end
end
