define safekeep::backup (
  $ensure = present,
  $data,
  $keepdays = '7',
  $backup_to_hostname = $safekeep::client::allowed_hostname,
){
  include safekeep::client

  @@safekeep::backup_exported { "${::fqdn}--${name}":
    ensure   => $ensure,
    data     => $data,
    keepdays => $keepdays,
    hostname => $::fqdn,
    tag      => $backup_to_hostname,
  }
}
