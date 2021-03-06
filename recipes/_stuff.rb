#
# Cookbook Name:: ownberry
# Recipe:: _stuff
#

# <
# some unrelated stuff
# >

#<> edit motd
file '/var/run/motd' do
  only_if { File.exist?('/var/run/motd') }
  action :delete
end

link '/etc/motd' do
  only_if { ::File.symlink?('/etc/motd') }
  action :delete
end

template '/etc/motd' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

#<> set aliases
template '/etc/profile.d/aliases.sh' do
  source 'aliases.erb'
  owner 'root'
  group 'root'
  mode 0755
  not_if { ::File.exist?('/etc/profile.d/aliases.sh') }
end
