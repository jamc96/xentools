# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include xentools
class xentools(
  Enum['present','absent'] $package_ensure   = 'present',
  Optional[String] $package_utilities_source = undef,
  Optional[String] $package_xenstore_source  = undef,
) {
  # validate if is virtual environment
  if $facts['is_virtual'] {
    # include classes
    include ::xentools::install
  }
}
