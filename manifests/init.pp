#
# php module
#
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# changed and improved by immerda project group admin(at)immerda.ch
# adapated by Puzzle ITC puzzle.ch
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Copyright 2010, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class php(
  $centos_use_remi = false,
  $webserver = 'apache'
) {
  case $operatingsystem {
    centos: { include php::base::centos }
    debian: { include php::base::debian }
    ubuntu: { include php::baes::ubuntu }
    gentoo: { include php::base::gentoo}
    default: { include php::base }
  }
}
