# == Class safekeep::install
#
# This class is called from safekeep for install.
#
class safekeep::install {

  package { $::safekeep::package_name:
    ensure => present,
  }
}
