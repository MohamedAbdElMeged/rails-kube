#!/bin/bash
RUN_TYPE=${RUN_TYPE}
sh entrypoint.sh
bundle check || bundle install
rake db:create db:migrate 
if [ "$RUN_TYPE" == "worker" ]; then
    bundle exec sidekiq
else
    bundle exec rails s -p 3000 -b '0.0.0.0'
fi
