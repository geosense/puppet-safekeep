define safekeep::backup_exported (
  $ensure,
  $data,
  $keepdays,
  $hostname,
){

  file { "/etc/safekeep/backup.d/${name}.backup":
    ensure  => $ensure,
    content => template('safekeep/hostbackup.backup.erb'),
    owner   => $::safekeep::params::user,
    group   => $::safekeep::params::group,
  }
  
}
