

['/var/lib/docker', '/etc/docker'].each do |dir|
        describe directory(dir) do
		it { should be_directory }
		if dir == '/etc/docker'
			its ('mode') { should cmp '0744' }
		else
			its ('mode') { should cmp '0711' }
		end
                its ('owner') { should eq 'root' }
                its ('group') { should eq 'root' }

        end
end

describe package('docker-ce') do
        it { should be_installed }
        its('version') { should eq '17.03.2.ce-1.el7.centos' }
end

describe docker.version do
	its('Server.Version') { should cmp >= '17.03.2-ce'}
end

['/etc/docker/daemon.json', '/usr/lib/systemd/system/docker.service'].each do |file|
        describe file(file) do
                it { should be_file }
                its ('mode') { should cmp '0644' }
                its ('owner') { should eq 'root' }
                its ('group') { should eq 'root' }
        end
end

describe systemd_service('docker') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
