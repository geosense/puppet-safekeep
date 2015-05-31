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
  $version = $::safekeep::params::version,
  $pkg_source = $::safekeep::params::pkg_source,
  $provider = $::safekeep::params::provider,
) inherits ::safekeep::params {

  # validate parameters here

  class { '::safekeep::install': } ->
  Class['::safekeep']
}
