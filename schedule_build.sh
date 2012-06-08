#!/bin/bash                                                                                                                       

next_build_date=`cat /path/to/your/blog/_site/next_build.txt`
current_date=`date +%s`

if (( $current_date > $next_build_date )) ; then
  /path/to/your/blog/main/repository.git/hooks/post-receive
fi
