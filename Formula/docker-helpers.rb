class DockerHelpers < Formula
  DH_VERSION="v0.0.5-alpha.6"

  homepage "https://github.com/chinthakagodawita/docker-helpers"
  url "https://github.com/chinthakagodawita/docker-helpers/archive/#{DH_VERSION}.tar.gz"
  sha256 "358e63e33d2ddcf855f4d445c903dd5d85ef445001bed1e831753141b1bb6e1d"
  head "https://github.com/chinthakagodawita/docker-helpers.git", branch: :experimental
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
      docker-helpers has been installed and is ready to go!
      Simply run `dh init` in order to get everything setup and in tip-top shape
      for you to start running Docker containers.

      Run `dh` to see a full list of commands.
    EOS
    s
  end
end
