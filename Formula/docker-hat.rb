class DockerHat < Formula
  DH_VERSION="v0.0.6"

  homepage "https://github.com/chinthakagodawita/docker-hat"
  url "https://github.com/chinthakagodawita/docker-hat/archive/#{DH_VERSION}.tar.gz"
  sha256 "5ef4d0ae729879ffb00c15635b4db74f992c31960bcf2c28ce0193c6d159aa34"
  head "https://github.com/chinthakagodawita/docker-hat.git", branch: :experimental
  version DH_VERSION

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
    s = <<-EOS.undent
      docker-hat has been installed and is ready to go!
      Simply run `dh init` in order to get everything setup and in tip-top shape
      for you to start running Docker containers.

      Run `dh` to see a full list of commands.
    EOS
    s
  end
end
