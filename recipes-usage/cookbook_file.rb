#Usage of Chef resource cookbook_file

cookbook_file "/usr/sbin/smart.sh" do
	source "smart.sh"
	mode '0755'
	owner 'root'
	group 'root'
	action :create
end
