require 'formula'

DINGHY_VERSION='4.6.1-fork.2'

class Dinghy < Formula
  homepage 'https://github.com/chinthakagodawita/dinghy'
  url  'https://github.com/chinthakagodawita/dinghy.git', :tag => "v#{DINGHY_VERSION}"
  head 'https://github.com/chinthakagodawita/dinghy.git', :branch => :fork
  version DINGHY_VERSION

  depends_on 'docker'
  depends_on 'docker-machine'
  depends_on "chinthakagodawita/dh/unfs3"

  def install
    bin.install "bin/dinghy"
    bin.install "bin/_dinghy_command"
    prefix.install "cli"
  end

  def caveats; <<~EOS
    Run `dinghy create` to create the VM, then `dinghy up` to bring up the VM and services.
    EOS
  end
end
