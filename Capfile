# Load DSL and Setup Up Stages
require 'capistrano/setup'

require 'capistrano/deploy'

require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/sidekiq'
require 'capistrano/sidekiq/monit'

require 'whenever/capistrano'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }