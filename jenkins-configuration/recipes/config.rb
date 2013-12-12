bash "install ruby because rvm cookbook freaks out" do
  Chef::Log.debug("installing ruby")
  code "[[ -s '/var/lib/jenkins/.rvm/scripts/rvm' ]] && source '/var/lib/jenkins/.rvm/scripts/rvm' && rvm install 1.9.3 --verify-downloads 1"
  user "jenkins"
  Chef::Log.debug("ruby installed")
end