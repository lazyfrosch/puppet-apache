class apache::params inherits ::apache::version {
    $package_name = 'apache2'

    $service_name = 'apache2'

    # internally used paths
    $config_path     = '/etc/apache2'

    if $::apache::version >= 2.4 {
        $conf_enable_dir = "${config_path}/conf-enabled"
        $conf_dir        = "${config_path}/conf-available"
        $confd_dir       = "${config_path}/conf-enabled"
    } else {
        $conf_enable_dir = undef
        $conf_dir        = undef
        $confd_dir       = "${config_path}/conf.d"
    }

    $mod_enable_dir  = "${config_path}/mods-enabled"
    $mod_dir         = "${config_path}/mods-available"
    $site_enable_dir = "${config_path}/sites-enabled"
    $site_dir        = "${config_path}/sites-available"
}
