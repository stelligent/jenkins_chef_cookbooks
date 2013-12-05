commit_job_config = "/var/tmp/commit-config.xml"

template commit_job_config do
  source 'commit-config.xml.erb'
end

jenkins_job 'commit-stage' do
  action :create
  config commit_job_config
end