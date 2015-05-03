# == Class: sitenetwork
#
# A wrapper module for `razorsedge/network` for setting sensible site global network configs and pulling in configuration from hiera.
#
# === Parameters
#
# Document parameters here.
#
# [*vlan*]
#   Enable kernel VLAN support
#
# [*hierahash*]
#   Name of the hiera hash to look upfor network configuration.
#
#
# === Examples
#
#  class { 'sitenetwork':
#  }
#
# === Authors
#
# Dan Foster <dan@zem.org.uk>
#
# === Copyright
#
# Copyright 2015 Dan Foster, unless otherwise noted.
#
class sitenetwork (
  $vlan = $sitenetwork::params::vlan
  $hierahash = $sitenetwork::params::hierahash
) inherits ::sitenetwork::params {
  class { 'network::global':
      vlan => $vlan,
  }

  $network = hiera_hash($hierahash,'')
  if $network {
    create_resources($hierahash, $network)
  }


}
