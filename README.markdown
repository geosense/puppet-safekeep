#### Table of Contents

1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Usage](#usage)
    * [Backup server](#backup-server)
    * [Backup client](#backup-client)
4. [Contributors](#contributors)

## Overview

Puppet module for managing safekeep backups. Currently can be used only for setting-up rdiff-backup (incremental) backups. Module manages ssh keys for you.

## Requirements

1. Install safekeep packages or repository with them.
2. Module needs puppet master with a support of exported resources (puppetdb).

## Usage

### Backup server
```
  class { 'safekeep::server':
    basedir => '/dir/with/backups/',
    emails  => 'comma,separated,emails,to,notify',
  }
```

### Backup client
```
  class { 'safekeep::client':
    allowed_hostname => 'backup-server.tld', 
  }
  safekeep::backup { 'backup-name': 
    # There must be at least two entries in data because of a bug in exported resources
    # Rule: first match wins
    data     => [
      ['exclude', 'regexp', '\.bak$'],
      ['include', 'path', '/srv'],
      ['include', 'glob', '/var/www/nginx/*.log'],
    ],
    keepdays => 7, #how many days of backups to store
  }
```

## Contributors

Jan Skoda, Geosense s.r.o.
