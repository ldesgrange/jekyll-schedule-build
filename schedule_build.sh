#!/bin/bash                                                                                                                       

build_file="/path/to/your/blog/_site/next_build.txt"
if [ ! -f $build_file ] ; then
  exit 0
fi

next_build_date=`cat $build_file`
current_date=`date +%s`

if (( $current_date > $next_build_date )) ; then
  /path/to/your/blog/main/repository.git/hooks/post-receive
fi
