define safekeep::backup (
  $ensure = present,
  $data,
  $keepdays = '7',
  $backup_to_hostname = $safekeep::client::allowed_hostname,
  $script = 'none',
){
  @@safekeep::backup_exported { "${::fqdn}--${name}":
    ensure   => $ensure,
    data     => $data,
    keepdays => $keepdays,
    hostname => $::fqdn,
    script   => $script,
    tag      => $backup_to_hostname,
  }
}
