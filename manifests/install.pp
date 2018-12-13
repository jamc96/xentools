# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include xentools::install
class xentools::install inherits xentools {
  # resource default 
  Package {
    ensure   => $xentools::package_ensure,
    provider =>  'rpm',
  }
  # ensure packages required
  package {
    'xe-guest-utilities-xenstore':
      source  => $xentools::package_xenstore_source;
    'xe-guest-utilities':
      source  => $xentools::package_utilities_source,
      require => Package['xe-guest-utilities-xenstore'];
  }
}
