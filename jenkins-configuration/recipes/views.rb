jenkins_url = "http://localhost:8080"
# jenkins_home = '/var/lib/jenkins'

#classloader problem with asking groovy plugin to do stuff
service "jenkins" do
  action :restart
end

ruby_block "sleep a bit" do
  block do
    sleep 180
  end
  action :create
end

cookbook_file "script to add Jenkins views" do
  source "create_views.groovy"
  path "/tmp/create_views.groovy"
end

jenkins_cli "add infrastructure view" do
  url jenkins_url
  command "groovy /tmp/create_views.groovy"
end
