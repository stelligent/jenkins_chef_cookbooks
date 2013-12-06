import hudson.model.Hudson;
import hudson.model.ListView;
import hudson.model.View;
import hudson.model.Hudson;
import au.com.centrumsystems.hudson.plugin.buildpipeline.BuildPipelineView;
import au.com.centrumsystems.hudson.plugin.buildpipeline.DownstreamProjectGridBuilder;

INITIAL_JOB = "trigger-stage";
pipelineView = new BuildPipelineView("trigger-stage",
                                     "trigger-stage",
                                     new DownstreamProjectGridBuilder(INITIAL_JOB),
                                     "5",    //final String noOfDisplayedBuilds,
                                     true,   //final boolean triggerOnlyLatestJob, 
                                     null);  //final String cssUrl

Hudson.instance.addView(pipelineView);



pipeline = new ListView("pipeline", Hudson.instance);

["commit-stage", "acceptance-stage", "capacity-stage", "exploratory-stage", "preproduction-stage", "production-stage"].each { job ->
	pipeline.add(Hudson.instance.getJob(job));
}

Hudson.instance.addView(pipeline);

println "Successfully create a view for the pipeline";
Hudson.instance.save();
