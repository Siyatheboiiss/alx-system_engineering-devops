# This Puppet manifest kills a process named 'killmenow' using pkill

exec { 'kill_killmenow':
  command => '/usr/bin/pkill -f killmenow',
  path    => ['/usr/bin', '/usr/local/bin'],
  onlyif  => '/usr/bin/pkill -0 -f killmenow',
}
