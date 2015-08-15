class safekeep::server (
  $basedir = '/var/lib/safekeep/',
  $user = 'safekeep',
  $emails = 'root,backup',
  $trickle = undef,
) {
  if ($trickle != undef) {
    package { 'trickle':
      ensure   => $trickle,
      provider => $::safekeep::provider
    }
  }
  package { 'safekeep-server':
    ensure   => present,
    provider => $::safekeep::provider
  } ~>
  file { "/etc/safekeep/safekeep.conf":
    ensure => 'file',
    content => template('safekeep/safekeep.conf.erb'),
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  sshkeys::create_ssh_key { 'safekeep': 
    group => 'nogroup',
  } ->
  file { $basedir:
    ensure => directory,
    owner  => $user,
  } ->

  Safekeep::Backup_exported<<|tag == $::fqdn|>>
}
