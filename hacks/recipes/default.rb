
bash "install ruby gems bundler" do
  code "gem install rubygems-bundler && echo complete"
  user "jenkins"
end