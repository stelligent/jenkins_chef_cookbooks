bash "install ruby because rvm cookbook freaks out" do
  #for some reason, rvm thinks 1.9.3 is already extracted but its not so configure or make will fail.  makes no sense
  #uninstall 1.9.3 in attempt to cleanse anything that could be misconstrued
  code "/var/lib/jenkins/.rvm/bin/rvm uninstall 1.9.3 && /var/lib/jenkins/.rvm/bin/rvm install 1.9.3 --verify-downloads 1"
  user "jenkins"
  not_if '/var/lib/jenkins/.rvm/bin/rvm list strings | grep ruby-1.9.3', :user => 'jenkins'
end
