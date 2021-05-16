
# Checking service ports are listening or not

[ ['sshd', '22'], ['nginx', '8080'], ['etcd', '2378'], ['kubelet', '10250'] ].each do |process, port|
	describe port(port) do
		it { should be_listening }
		its('processes') { should include process }
	end
end

