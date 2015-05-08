# == Class safekeep::params
#
# This class is meant to be called from safekeep.
# It sets variables according to platform.
#
class safekeep::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'safekeep'
      $service_name = 'safekeep'
    }
    'RedHat', 'Amazon': {
      $package_name = 'safekeep'
      $service_name = 'safekeep'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
