cookbook_file "script to add Jenkins views" do
  source "create_views.groovy"
  path "/tmp/create_views.groovy"
end
