class DockerHelpers < Formula
  homepage "https://github.com/chinthakagodawita/docker-helpers"
  url "https://github.com/chinthakagodawita/docker-helpers/archive/v0.0.5-alpha.2.tar.gz"
  sha256 "97c85eeeb7d4996c8f38cc5e1e1c1d06cd24c734daeea32ec5ca90b853725612"

  option "with-vbox", "Build with VirtualBox (via brew cask)"
  option "with-vagrant", "npm will not be installed"

  depends_on "node"
  depends_on "docker"
  depends_on "docker-machine"
  depends_on "dinghy"

  def install
    puts "installing!"

    system "npm", "install -g"
  end

  def post_install
    puts "yo"
  end

  def caveats
    s = ""

    if build.with? "vbox"
      s += <<-EOS.undent
        stuff
      EOS
    else
      s += <<-EOS.undent
        some other stuff
      EOS
    end

    s
  end
end
