#Usage of Chef resource remote_file

remote_file '/opt/apache/apache.conf' do
  source "https://example.com/location/apache.conf"
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
