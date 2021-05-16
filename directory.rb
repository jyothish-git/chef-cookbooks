#Usage of Chef resource directory

directory "/opt/iSMART" do
	owner "root"
	group "root"
	mode "0755"
	action :create
    recursive true
end
