require 'formula'

class Dinghy < Formula
  homepage 'https://github.com/codekitchen/dinghy'
  head 'https://github.com/codekitchen/dinghy.git', branch: :machine

  depends_on 'docker'
  depends_on 'docker-machine'
  depends_on 'unfs3'
  depends_on 'dnsmasq'

  def install
    bin.install "bin/dinghy"
    prefix.install "cli"
  end

  def caveats; <<-EOS.undent
    Run `dinghy up` to bring up the VM and services.
    EOS
  end
end
