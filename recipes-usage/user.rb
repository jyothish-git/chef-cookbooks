#Usage of Chef resource user

user "jyothish" do
  comment "new user"
  home "/home/jyothish"
  shell "/bin/bash"
  manage_home true
end
