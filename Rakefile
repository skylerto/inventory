require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Sets up the database"
task :setup do
  exec("./bin/setup")
end
