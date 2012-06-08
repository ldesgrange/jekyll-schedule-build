# jekyll_schedule_build #

The purpose of this plugin is to allow pushing posts with a date in the future and publish them at the right time.

There are 2 parts in this plugin. The plugin itself, writing a file with the publication date of next post, and a bash script ran by cron, comparing next post date with current date and rebuilding the site if necessary.

## Misc ##

Putting `no_schedule: true` in your `_config.yml` will deactivate the plugin.

Putting `no_schedule: true` in your post will deactivate the plugin for the post.
