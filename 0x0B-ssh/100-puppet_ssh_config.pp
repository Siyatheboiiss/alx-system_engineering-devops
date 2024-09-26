# Puppet manifest to configure SSH client settings
# This sets up the SSH client to use a specific private key and disables password authentication.

class { 'ssh::client':
  config_file => '/home/vagrant/.ssh/config',
}

file { '/home/vagrant/.ssh/config':
  ensure  => file,
  content => template('ssh/ssh_config.erb'),
  owner   => 'vagrant',
  group   => 'vagrant',
  mode    => '0600',
}

file_line { 'Declare identity file':
  path  => '/home/vagrant/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^    IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/home/vagrant/.ssh/config',
  line  => '    PasswordAuthentication no',
  match => '^    PasswordAuthentication',
}
