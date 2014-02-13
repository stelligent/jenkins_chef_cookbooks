jobs = [ "trigger", "commit", "acceptance", "capacity", "exploratory", "preproduction", "production", "jenkins-test"]
params = jobs.collect { |job| {  :name => job,  :source => "#{job}-config.xml.erb",  :target => "/var/tmp/#{job}-config.xml" } }


params.each do |param|

  template param[:target] do
    source param[:source]

    variables(
      { :source_repo => node['pipeline']['source'] }
    )
  end

  jenkins_job param[:name] do
    action :create
    config param[:target]
  end

end

