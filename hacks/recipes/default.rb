
bash "install ruby gems bundler" do
  code "gem install rubygems-bundler"
  user "jenkins"
end