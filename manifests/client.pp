class safekeep::client (
  $allowed_hostname,
) {
  include safekeep

  package { 'trickle': }
  package { 'safekeep-client':
    ensure   => present,
    provider => $::safekeep::provider,
    require  => Class['safekeep'],
  } ~>

  sshkeys::set_authorized_key { "allow safekeep@$allowed_hostname to root@$fqdn":
    local_user => 'root',
    remote_user => "safekeep@$allowed_hostname",
  }
}
