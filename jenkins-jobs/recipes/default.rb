commit_job_config = "/var/tmp/projectmonitor-trigger-config.xml"

template commit_job_config do
  source 'commit-config.xml'
end

jenkins_job 'commit-stage' do
  action :create
  config commit_job_config
end