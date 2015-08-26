require 'formula'

class Dinghy < Formula
  homepage 'https://github.com/chinthakagodawita/dinghy'
  head 'https://github.com/chinthakagodawita/dinghy.git', branch: 'machine-experimental'

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
