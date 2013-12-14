trigger_job_config = "/var/tmp/trigger-config.xml"
commit_job_config = "/var/tmp/commit-config.xml"
acceptance_job_config = "/var/tmp/acceptance-config.xml"
capacity_job_config = "/var/tmp/capacity-config.xml"
exploratory_job_config = "/var/tmp/exploratory-config.xml"
preproduction_job_config = "/var/tmp/preproduction-config.xml"
production_job_config = "/var/tmp/production-config.xml"
setup_job_config = "/var/tmp/setup.xml"

template trigger_job_config do
  source 'trigger-config.xml.erb'
end

jenkins_job 'trigger-stage' do
  action :create
  config trigger_job_config
end

template commit_job_config do
  source 'commit-config.xml.erb'
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

template setup_job_config do
  source 'setup_job_config.xml.erb'
end

jenkins_job 'setup' do
  action :create
  config setup_job_config
end

