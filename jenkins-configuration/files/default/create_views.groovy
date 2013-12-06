import hudson.model.Hudson;
import hudson.model.ListView;
import hudson.model.View;



pipeline = new ListView("pipeline", Hudson.instance);

["commit-stage", "acceptance-stage", "capacity-stage", "exploratory-stage", "preproduction-stage", "production-stage"].each { job ->
	infrastructureView.add(Hudson.instance.getJob(job));
}

Hudson.instance.addView(pipeline);

println "Successfully create a view for the pipeline";
Hudson.instance.save();
