#Usage of Chef resource package

package wget do
	action :install
end


['wget', 'zip', 'locate'].each do |pack|
	package pack
end
