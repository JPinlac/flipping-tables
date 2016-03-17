# Require a package list update for Package(s)
exec { 'apt-update':
  command => "apt-get -yq update",
  path    => ["/bin","/sbin","/usr/bin","/usr/sbin"]
}
Exec["apt-update"] -> Package <| |>

####################################
# Core
import './box-essentials.pp'
include box-essentials

####################################
# Dev
import './box-dev-environment.pp'
include box-dev-environment