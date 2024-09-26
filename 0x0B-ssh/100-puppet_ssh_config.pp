# Puppet manifest to configure SSH client settings
# This sets up the global SSH client configuration to use a specific private key and disables password authentication.

file { '/etc/ssh/ssh_config':
  ensure  => file,
  content => template('ssh/ssh_config.erb'),
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^    IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => '    PasswordAuthentication no',
  match => '^    PasswordAuthentication',
}
