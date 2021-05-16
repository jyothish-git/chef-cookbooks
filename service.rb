#Usage of Chef resource service

service "sshd" do
	action [ :enable, :start ]
end
