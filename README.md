jenkins_chef_cookbooks
======================

A collection of cookbooks used to set up a Jenkins server.

Put this together using berkshelf, since it makes everything way easier. If you need to update the cookbooks, it's simple enough:

```
gem install berkshelf
berks install --path temp
cp -R temp/* .
rm -rf temp
```
:books: