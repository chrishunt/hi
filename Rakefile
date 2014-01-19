require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'cane/rake_task'
require 'cane/hashcheck'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--color'
end

Cane::RakeTask.new(:quality) do |t|
  t.use Cane::HashCheck
end

task default: :spec
task default: :quality
