# == Class safekeep::params
#
# This class is meant to be called from safekeep.
# It sets variables according to platform.
#
class safekeep::params {
  $version = '1.4.2',
  $pkg_source = undef,

  case $::osfamily {
    'Debian': {
      $provider = 'apt',
    }
    'Gentoo': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
