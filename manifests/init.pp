# == Class: apache
#
# Replacement for Puppetlabs-apache (still work in progress!)
#
# === Authors
#
# Markus Frosch <markus@lazyfrosch.de>
#
# === Copyright
#
# Copyright 2014 Markus Frosch <markus@lazyfrosch.de>
#
# (general structure and variable names have been used from the module
#  puppetlabs-apache)
#
class apache (
    $package_name   = $::apache::params::package_name,
    $package_ensure = 'installed',
    $service_name   = $::apache::params::service_name,
    $service_enable = true,
    $service_ensure = 'running',
) inherits ::apache::params {

    if $::osfamily != 'Debian' {
        # TODO
        fail('The apache module is currently only designed for Debian based systems!')
    }

    package { 'httpd':
        ensure => $package_ensure,
        name   => $package_name,
        notify => Class['Apache::Service'],
    }

    class { '::apache::service':
        service_name   => $service_name,
        service_ensure => $service_ensure,
        service_enable => $service_enable,
    }
}
