class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "518963fdfb9796c18cf87c1d2521aff7c9f2b065babd97e8d05da4d300e17796"
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
    assert_equal "1.0.5", shell_output("#{bin}/polish --version").strip
  end
end
