define apache::mod (
    $package = undef,
    $package_ensure = 'present',

    $has_conf = false,
) {
    include ::apache::params

    if $package {
        package { $package:
            ensure  => $package_ensure,
            require => Package['httpd'],
            before  => File["httpd-${name}.load"],
        }
    }

    file { "apache-${name}.load":
        ensure => link,
        path   => "${::apache::parms::mod_enable_dir}/${name}.load",
        target => "${::apache::parms::mod_dir}/${name}.load",
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
    }

    if $has_conf {
        file { "apache-${name}.conf":
            ensure => link,
            path   => "${::apache::parms::mod_enable_dir}/${name}.conf",
            target => "${::apache::parms::mod_dir}/${name}.conf",
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
        }
    }
}
