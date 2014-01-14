bash 'setup git for jenkins user' do
  code <<-END
    su -c 'git config --global user.name #{node[:jenkins_git][:username]}' - jenkins
    su -c 'git config --global user.email #{node[:jenkins_git][:email]}' - jenkins
  END
end

bash 'setup known hosts for jenkins user' do
  code <<-END
    ssh-keyscan github.com > /var/lib/jenkins/.ssh/known_hosts
    chown jenkins:jenkins /var/lib/jenkins/.ssh/known_hosts
  END
end
