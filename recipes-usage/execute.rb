#Usage of Chef resource execute

execute 'list files' do
	command 'ls -ltr /home'
	action :run
end
