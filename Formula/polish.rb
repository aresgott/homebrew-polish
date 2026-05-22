class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "f4e88850685726f2ff6faf20c2b997621610dfb5a6865145d9075ce6f3ad887f"
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
    assert_equal "1.0.1", shell_output("#{bin}/polish --version").strip
  end
end
