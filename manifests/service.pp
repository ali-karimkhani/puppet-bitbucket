#
class bitbucket::service inherits bitbucket {

  file { "${service_path}":
    ensure  => present,
    content => template('bitbucket/bitbucket.service.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  exec { 'refresh_systemd':
    command     => 'systemctl daemon-reload',
    refreshonly => true,
    subscribe   => File[$service_path],
    before      => Service['bitbucket'],
  }

  service { 'bitbucket':
    require => File[$service_path],
  }

}
