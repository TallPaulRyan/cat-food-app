require 'rspec/core/rake_task'
require 'pact_broker/client/tasks'

$: << './lib'

RSpec::Core::RakeTask.new(:spec)

PactBroker::Client::PublicationTask.new do | task |
  require 'cat_food_app/version'
  short_git_hash=`git rev-parse --short HEAD`.strip
  task.consumer_version = "#{short_git_hash}-#{CatFoodApp::VERSION}"
  task.pact_broker_base_url = 'http://pact-broker:9292'
  # task.branch =`git branch --show-current`.strip
  # task.tag_with_git_branch = true|false # Superseeded by first class `branch` support
  # task.tags = ["dev"] # optional
  # task.build_url = ENV["CI_BUILD_URL"] # Supported from v1.59.0
  # task.pact_broker_basic_auth =  { username: 'basic_auth_user', password: 'basic_auth_pass'} # optional
  # task.pact_broker_token = "1234abcd" # Bearer token
end

task :default => :spec

desc 'Deploy to halo'
task :deploy_to_halo do
  p "Executing pact-broker record-deployment."
  environment = 'halo'
  participant = 'Cat Food App'
  provider_version = ENV['GIT_COMMIT'] || `git rev-parse --short --verify HEAD`.strip
  # --broker-base-url=http://pact-broker:9292 is defined in the env var PACT_BROKER_BASE_URL
  `pact-broker record-deployment --environment=#{environment} --pacticipant=#{participant} --version=#{provider_version}`
end