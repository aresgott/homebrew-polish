class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "c21637f199238faad5b8556ed68472f130dcc45caadfa8e3197947037a33ace0"
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
