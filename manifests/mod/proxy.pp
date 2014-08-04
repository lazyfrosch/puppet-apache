class apache::mod::proxy {
    ::apache::mod { 'proxy':
        has_conf => true,
    }
}
