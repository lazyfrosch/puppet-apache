class apache::mod::passenger {

    # TODO: much todo here!
    package { 'libapache2-mod-passenger':
        ensure => installed,
    } ->
    ::apache::mod { 'passenger': }

}
