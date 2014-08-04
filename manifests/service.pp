class apache::service (
    $service_name = $::apache::params::service_name,
    $service_enable = true,
    $service_ensure = 'running',
) inherits ::apache::params {
    validate_bool($service_enable)

    service { 'httpd':
        ensure => $service_ensure,
        name   => $service_name,
        enable => $service_enable,
    }
}
