#
# Cookbook Name:: jenkins_git
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

jenkins_home = '/var/lib/jenkins'

yum_package "nodejs" do
  version '0.10.21-1.el6'
end

execute "add github to known_hosts" do
  command "ssh-keyscan github.com >> #{jenkins_home}/.ssh/known_hosts"
end

execute "fix ownership of known_hosts" do
  command "chown jenkins:jenkins #{jenkins_home}/.ssh/known_hosts"
end

#this could be controlled by the git plugin confiuration if you care
execute "create jenkins git name" do
  command "su - jenkins -c 'git config --global user.name #{node[:git][:username]}'"
end

execute "create jenkins git email" do
  command "su - jenkins -c 'git config --global user.email #{node[:git][:email]}'"
end

chef_gem 'aws-sdk' do
  version '1.21.0'
end


ruby_block "pull creds" do
  block do
    case node[:git][:deploy_key_src]
    when 's3'
      download_s3_bucket_to_local_dir('jenkinscreds', "#{jenkins_home}/.ssh/")
    else
      FileUtils.cp(Dir.glob('/var/tmp/jenkins_git_keys/*'),"#{jenkins_home}/.ssh/")
    end
  end
end

execute "fix ownership of keys" do
  command "chown -R jenkins:jenkins #{jenkins_home}/.ssh"
end

execute "fix permissions of keys" do
  command "chmod 0600 #{jenkins_home}/.ssh/*"
end

cookbook_file "#{jenkins_home}/.ssh/config" do
  source "ssh_config"
  mode 0400
  owner "jenkins"
  group "jenkins"
end
