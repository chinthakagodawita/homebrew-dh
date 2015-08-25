class DockerHelpers < Formula
  DH_VERSION="v0.0.5-alpha.5"

  homepage "https://github.com/chinthakagodawita/docker-helpers"
  url "https://github.com/chinthakagodawita/docker-helpers/archive/#{DH_VERSION}.tar.gz"
  sha256 "53fec67103b04152ea9b43a62d232215836534bd64c26a59f01a6c9a2a643eb2"
  head "https://github.com/chinthakagodawita/docker-helpers.git", branch: :experimental
  version DH_VERSION

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
