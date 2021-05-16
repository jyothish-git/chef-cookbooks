#Usage of Chef resource cron

cron 'authentication_script' do
	minute '*/5'
	hour '*'
	command "/usr/sbin/authentication.sh"
end
