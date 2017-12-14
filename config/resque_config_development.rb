require 'resque' # include resque so we can configure it
Resque.redis = "127.0.0.1:6379" # tell Resque where redis lives

# This will make the tabs show up.
require 'resque-scheduler'
require 'resque/scheduler/server'