#!/usr/bin/ruby

###------------------------------------------------------------------------------------%%
###------------------------------------------------------------------------------------%%
### Content: Open-Science-Paper ruby build server
### Usage: Continous build your Open-Science-Paper on changes
### Author: Claas-Thido Pfaff
###------------------------------------------------------------------------------------%%
###------------------------------------------------------------------------------------%%

# This requires you to install the fssm gem  to work
#       gem install fssm

require 'rubygems'
require 'fssm'

cmd = "make"

FSSM.monitor do
  path 'osp/' do
    glob '**/*'
    update {|base, relative| system cmd}
    delete {|base, relative| system cmd}
    create {|base, relative| system cmd}
  end

  path 'usr/' do
    glob '**/*'
    update {|base, relative| system cmd}
    delete {|base, relative| system cmd}
    create {|base, relative| system cmd}
  end
end
