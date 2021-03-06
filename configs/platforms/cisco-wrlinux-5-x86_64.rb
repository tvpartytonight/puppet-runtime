platform "cisco-wrlinux-5-x86_64" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "sysv"
  # The development environment provided by Cisco includes the build dependencies
  # such as autoconf automake createrepo rsync gcc make rpm-build rpm-libs yum-utils
  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/yum/cisco-wrlinux/5/pl-build-tools-cisco-wrlinux-5.repo"
  packages = [
    "make",
    "pkgconfig",
    "pl-cmake",
    "readline-devel",
    "zlib-devel",
  ]
  plat.provision_with("yum install -y --nogpgcheck  #{packages.join(' ')}")
  plat.install_build_dependencies_with "yum install -y"
  plat.vmpooler_template "cisco-wrlinux-5-x86_64"
end
