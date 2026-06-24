class ImagewebMacos < Formula
  desc "Finder Quick Actions for image-web — right-click image compression in macOS"
  homepage "https://github.com/maximilianMairinger/imageWebMacGUI"
  url "https://github.com/maximilianMairinger/imageWebMacGUI/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "78d9aefe3fbf93fd4e8bdbdb3e4d87f9d6e3d1667b4401174ebab04c90ee983f"
  license "MIT"

  depends_on :macos
  depends_on "node"
  depends_on cask: "swiftdialog"

  def install
    # Install image-web CLI from npm into formula-local prefix
    system "npm", "install", "-g", "--prefix", libexec/"npm", "image-web"
    bin.install_symlink libexec/"npm/bin/image-web"

    # Install Quick Actions scripts and workflows
    libexec.install Dir["*"]

    (bin/"imageweb-setup").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/install.sh"
    EOS

    (bin/"imageweb-teardown").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/uninstall.sh"
    EOS

    chmod 0755, bin/"imageweb-setup"
    chmod 0755, bin/"imageweb-teardown"
  end

  def caveats
    <<~EOS
      To register the Finder Quick Actions, run once:
        imageweb-setup

      To remove them later (before brew uninstall):
        imageweb-teardown
    EOS
  end

  test do
    assert_predicate libexec/"install.sh", :exist?
    assert_predicate libexec/"uninstall.sh", :exist?
    assert_predicate bin/"imageweb-setup", :exist?
  end
end
