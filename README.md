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

:books: :books: :books:

The custom cookbooks are as follows:
* jenkins-configuration: cookbooks to configure Jenkins jobs, views, etc.


:books: :books: :books:
