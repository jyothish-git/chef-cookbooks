#Usage of Chef resource directory

directory "/opt/myfolder" do
	owner "root"
	group "root"
	mode "0755"
	action :create
    recursive true
end
