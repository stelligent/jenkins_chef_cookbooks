ruby_version = '2.0.0'
bash "install ruby because rvm cookbook freaks out" do
  #for some reason, rvm thinks src is already extracted but its not so configure or make will fail.  makes no sense
  #uninstall the whole thing in attempt to cleanse anything that could be misconstrued
  code "/var/lib/jenkins/.rvm/bin/rvm uninstall #{ruby_version} && /var/lib/jenkins/.rvm/bin/rvm install #{ruby_version} --verify-downloads 1"
  user 'jenkins'
  not_if "/var/lib/jenkins/.rvm/bin/rvm list strings | grep ruby-#{ruby_version}", :user => 'jenkins'
end
