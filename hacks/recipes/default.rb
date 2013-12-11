
bash "install ruby gems bundler" do
  code "gem install rubygems-bundler && echo complete"
  user "jenkins"
end

bash "soft link gem exe" do
  code "ln -s /usr/bin/gem /usr/local/bin/gem"
  user "jenkins"
end

