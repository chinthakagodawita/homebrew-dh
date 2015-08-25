class DockerHelpers < Formula
  homepage "https://github.com/chinthakagodawita/docker-helpers"
  url "https://github.com/chinthakagodawita/docker-helpers/archive/v0.0.5-alpha.3.tar.gz"
  sha256 "ead89d99960ef16909b98aadd48911b021ee48db3c85f4c6ba70a2f499c1d62d"
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
