bash "install ruby because rvm cookbook freaks out" do
  code "[[ -s '/var/lib/jenkins/.rvm/scripts/rvm' ]] && source '/var/lib/jenkins/.rvm/scripts/rvm' && rvm install #{node[:jenkins][:ruby_version]} --verify-downloads 1"
  user "jenkins"
end