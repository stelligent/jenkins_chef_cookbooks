#
# Cookbook Name:: jenkins_postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#hstore needed by tests
yum_package 'postgresql-contrib' do
  version '9.2-1.19.amzn1'
end

execute "create jenkins user for unit-ish tests that can login and do whatever" do
  command "su --command=\"createuser -l -s #{node['jenkins']['user']}\" - #{node['postgres']['user']}"
  ignore_failure true
end

bash 'install json enhancements' do
  code <<END
    git clone https://bitbucket.org/qooleot/json_enhancements
    cd json_enhancements
    make
    make install
END
end

execute 'create extensions' do
  command "su --command=\"psql template1 -c 'create extension hstore; create extension json_enhancements;'\" - #{node['postgres']['user']}"
end
