class safekeep::server (
  $basedir = '/var/lib/safekeep/'
) {
  package { ['safekeep-server', 'trickle']:
    ensure   => present,
    provider => $::safekeep::provider
  } ~>
  file_line { 'set basedir':
    path  => '/etc/safekeep/safekeep.conf',
    match => '^base.dir',
    line  => "base.dir = $basedir",
  } ->
  sshkeys::create_ssh_key { 'safekeep': 
    group => 'nogroup',
  } ->
  file { $basedir:
    ensure => directory,
    owner  => 'safekeep',
  } ->

  Safekeep::Backup_exported<<|tag == $::fqdn|>>
}
