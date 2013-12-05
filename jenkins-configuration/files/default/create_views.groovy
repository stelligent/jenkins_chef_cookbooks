import hudson.model.Hudson;
import hudson.model.ListView;
import hudson.model.View;



infrastructureView = new ListView("pipeline", Hudson.instance);

Hudson.instance.addView(infrastructureView);

println "Successfully create a view for the pipeline";
Hudson.instance.save();
