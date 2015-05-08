# == Class: safekeep
#
# Full description of class safekeep here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class safekeep (
  $package_name = $::safekeep::params::package_name,
  $service_name = $::safekeep::params::service_name,
) inherits ::safekeep::params {

  # validate parameters here

  class { '::safekeep::install': } ->
  class { '::safekeep::config': } ~>
  class { '::safekeep::service': } ->
  Class['::safekeep']
}
