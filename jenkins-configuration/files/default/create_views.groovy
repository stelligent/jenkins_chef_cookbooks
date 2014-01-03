import hudson.model.Hudson;
import hudson.model.ListView;
import hudson.model.View;
import hudson.model.Hudson;
import au.com.centrumsystems.hudson.plugin.buildpipeline.BuildPipelineView;
import au.com.centrumsystems.hudson.plugin.buildpipeline.DownstreamProjectGridBuilder;

def addView(title, view) {
  views = Hudson.instance.getViews();
  foundViews = views.findAll{ viewIterator ->
    viewIterator.getViewName().equals(title);
  }
  if(foundViews.size() == 0) {
    Hudson.instance.addView(view);
    println "Successfully create a view for the ${title}";
  } 
  else {
    println "The view ${title} already exists, not adding again";
  }
}

INITIAL_JOB = "trigger-stage";
pipelineViewName = "Continuous Delivery Pipeline"
pipelineView = new BuildPipelineView(pipelineViewName,
                                     pipelineViewName,
                                     new DownstreamProjectGridBuilder(INITIAL_JOB),
                                     "5",    //final String noOfDisplayedBuilds,
                                     true,   //final boolean triggerOnlyLatestJob, 
                                     null);  //final String cssUrl

addView(pipelineViewName, pipelineView);

//////
pipeline = new ListView("pipeline", Hudson.instance);
pipeline_jobs = ["trigger-stage", "commit-stage", "acceptance-stage", 
                 "capacity-stage", "exploratory-stage", "preproduction-stage", "production-stage"]
pipeline_jobs.each { job ->
  pipeline.add(Hudson.instance.getJob(job));
}

addView("pipeline",pipeline);

Hudson.instance.save();
