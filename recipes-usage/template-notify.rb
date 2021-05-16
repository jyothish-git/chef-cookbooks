#Usage of Chef resource notify

template "/etc/rsyslog.conf" do
    source 'rsyslog.conf.erb'
    mode 0644
    owner "root"
    group "root"
    notifies :restart, 'service[rsyslog]'
end


service "rsyslog" do
        action [ :enable, :restart ]
end
