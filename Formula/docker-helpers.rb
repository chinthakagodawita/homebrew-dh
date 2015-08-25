class DockerHelpers < Formula
  homepage "https://github.com/chinthakagodawita/docker-helpers"
  url "https://github.com/chinthakagodawita/docker-helpers/archive/v0.0.5-alpha.4.tar.gz"
  sha256 "bdf39165e9e5bfd09187e39d4411bec8f5e15d737f8c6993e02dd3feae40ba58"
  head "https://github.com/chinthakagodawita/docker-helpers.git", branch: :experimental

  option "with-vbox", "Build with VirtualBox (via brew cask)"
  option "with-vagrant", "npm will not be installed"

  depends_on "node"
  depends_on "docker"
  depends_on "docker-machine"
  depends_on "dinghy"

  def install
    # Add npm to path.
    ENV.prepend_path "PATH", "#{Formula["node"].opt_libexec}/npm/bin"

    # Install all node depedencies.
    system "npm", "install"

    # Install all in libexec.
    libexec.install Dir["*"]

    # Symlink main binary.
    bin.install_symlink libexec/"bin/dh.js" => "dh"
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
