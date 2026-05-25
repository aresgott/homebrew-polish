class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "eb5b0efeaf400a1f04c2cc3667bb933090de77aa9d8739bd6b959f0048d02dba"
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
    assert_equal "1.0.3", shell_output("#{bin}/polish --version").strip
  end
end
