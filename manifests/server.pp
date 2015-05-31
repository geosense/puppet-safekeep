class safekeep::server {
  package { ['safekeep-server', 'trickle']:
    ensure   => present,
    provider => $::safekeep::provider
  }
  sshkeys::create_ssh_key { 'safekeep': 
    group => 'nogroup',
  } 

  Safekeep::Backup_exported<<|tag == $::fqdn|>>
}
