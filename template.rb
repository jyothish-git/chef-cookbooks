#Usage of Chef resource template

template "/usr/local/bin/script.sh" do
	source 'script.sh.erb' #maintain this file in templates/default folder
	#source 'scripts/scripts.sh.erb'
	mode "0755"
	owner "root"
	group "root"
end
