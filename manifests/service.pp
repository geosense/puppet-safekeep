# == Class safekeep::service
#
# This class is meant to be called from safekeep.
# It ensure the service is running.
#
class safekeep::service {

  service { $::safekeep::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
