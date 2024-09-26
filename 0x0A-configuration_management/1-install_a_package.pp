# This Puppet manifest installs Flask version 2.1.0 and the compatible Werkzeug version using pip3

package { 'python3-pip':
  ensure => installed,
}

exec { 'install_werkzeug':
  command => '/usr/bin/pip3 install Werkzeug==2.1.2',
  path    => ['/usr/bin', '/usr/local/bin'],
  unless  => '/usr/bin/pip3 show Werkzeug | grep 2.1.2',
  require => Package['python3-pip'],
}

exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => ['/usr/bin', '/usr/local/bin'],
  unless  => '/usr/bin/pip3 show Flask | grep 2.1.0',
  require => Exec['install_werkzeug'],
}
