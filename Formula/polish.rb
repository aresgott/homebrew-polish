class Polish < Formula
  desc "Fix grammar and tone with ChatGPT, copy to clipboard"
  homepage "https://github.com/aresgott/polish"
  url "https://github.com/aresgott/polish/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "2b12dc6fdc7b52df4cff4e98a1e854e42562e24833abfd4b28e23cc80974a271"
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
    assert_equal "1.0.4", shell_output("#{bin}/polish --version").strip
  end
end