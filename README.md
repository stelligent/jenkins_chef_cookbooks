jenkins_chef_cookbooks
======================

A collection of cookbooks used to set up a Jenkins server. You can point to this repo with OpsWorks if you want to create a custom Jenkins layer.

Most of these cookbooks are just copies of open source cookbooks. They were retrieved using berkshelf, since it makes everything way easier. If you need to update the open source cookbooks, it's simple enough; just add the new dependency to Berksfile, and then run these commands:

```
gem install berkshelf
berks install --path temp
cp -R temp/* .
rm -rf temp
```

(berkshelf seemed to nuke the directory that you pass in with --path, so don't just try passing in the current directory. That took me a little while to figure out...)

---

The custom cookbooks are as follows:
* jenkins-configuration: cookbooks to configure Jenkins jobs, views, etc.
* rvm: the one berkshelf pulls in is wicked old, and the override wasn't working. I just downloaded it manually.

How to use this repository
======================

This repository is design to be used as the custom Chef cookbooks repository for a Jenkins stack built using Amazon's OpsWorks service. I suppose you could use it to build a custom Jenkins server without using OpsWorks, but I haven't tried that so if you give it a shot you're on your own. :)

If you're building your OpsWorks script using the Ruby SDK, it'll look something like this:

    stack_params = {
      name: "Jenkins Server", 
      region: "us-west-2", 
      default_os: 'Amazon Linux',
      service_role_arn: 'arn:aws:iam::123467890:role/aws-opsworks-service-role', 
      default_instance_profile_arn: 'arn:aws:iam::123467890:instance-profile/jenkins',
      custom_json: custom_json,
      use_custom_cookbooks: true,
      custom_cookbooks_source: {
          type: 'git',
          url: 'https://github.com/stelligent/jenkins_chef_cookbooks.git'
        }
    }

    stack = ops.create_stack stack_params


:books: 
