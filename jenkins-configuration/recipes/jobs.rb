#Copyright (c) 2014 Stelligent Systems LLC
#
#MIT LICENSE
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.

trigger_job_config = "/var/tmp/trigger-config.xml"
commit_job_config = "/var/tmp/commit-config.xml"
acceptance_job_config = "/var/tmp/acceptance-config.xml"
capacity_job_config = "/var/tmp/capacity-config.xml"
exploratory_job_config = "/var/tmp/exploratory-config.xml"
preproduction_job_config = "/var/tmp/preproduction-config.xml"
production_job_config = "/var/tmp/production-config.xml"
setup_job_config = "/var/tmp/setup-config.xml"
jenkins_test_config = "/var/tmp/setup-config.xml"

template trigger_job_config do
  source 'trigger-config.xml.erb'

  variables(
    { :source_repo => node['pipeline']['source'] }
  )
end

jenkins_job 'trigger-stage' do
  action :create
  config trigger_job_config
end

template commit_job_config do
  source 'commit-config.xml.erb'

  variables(
    { :source_repo => node['pipeline']['source'] }
  )
end

jenkins_job 'commit-stage' do
  action :create
  config commit_job_config
end

template acceptance_job_config do
  source 'acceptance-config.xml.erb'
end

jenkins_job 'acceptance-stage' do
  action :create
  config acceptance_job_config
end

template capacity_job_config do
  source 'capacity-config.xml.erb'
end

jenkins_job 'capacity-stage' do
  action :create
  config capacity_job_config
end

template exploratory_job_config do
  source 'exploratory-config.xml.erb'
end

jenkins_job 'exploratory-stage' do
  action :create
  config exploratory_job_config
end

template preproduction_job_config do
  source 'preproduction-config.xml.erb'
end

jenkins_job 'preproduction-stage' do
  action :create
  config preproduction_job_config
end

template production_job_config do
  source 'production-config.xml.erb'
end

jenkins_job 'production-stage' do
  action :create
  config production_job_config
end

template jenkins_test_config do
  source 'jenkins-test-config.xml.erb'
end

jenkins_job 'jenkins-test' do
  action :create
  config jenkins_test_config
end

# template setup_job_config do
#   source 'setup_config.xml.erb'
# end

# jenkins_job 'setup' do
#   action :create
#   config setup_job_config
# end

