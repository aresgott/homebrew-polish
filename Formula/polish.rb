class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2f46251bbd59e253385f39222752c346de258ef39072c16b1f48ce7922fb8ad0"
  license "MIT"
  head "https://github.com/aresgott/polish.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "ci", "--ignore-scripts"
    system "npm", "run", "build"
    libexec.install "dist", "node_modules", "package.json", ".npmrc", ".npmrc"
    bin.install_symlink libexec/"dist/cli.js" => "polish"
  end

  test do
    assert_equal "1.0.0", shell_output("#{bin}/polish --version").strip
  end
end

