jenkins_url = "http://localhost:8080"
# jenkins_home = '/var/lib/jenkins'

cookbook_file "script to add Jenkins views" do
  source "create_views.groovy"
  path "/tmp/create_views.groovy"
end

jenkins_cli "add infrastructure view" do
  url jenkins_url
  command "groovy /tmp/create_views.groovy"
end
