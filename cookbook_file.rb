#Usage of Chef resource cookbook_file

cookbook_file "/usr/sbin/smartmon.sh" do
	source "smartmon.sh"
	mode '0755'
	owner 'root'
	group 'root'
	action :create
end
