require 'appengine-rack'
AppEngine::Rack.configure_app(
    :application => 'application-id',
    :precompilation_enabled => true,
    :sessions_enabled => true,
    :version => "1")

AppEngine::Rack.app.resource_files.exclude :rails_excludes
ENV['RAILS_ENV'] = AppEngine::Rack.environment

require ::File.expand_path('../config/environment',  __FILE__)
use Rails::Rack::LogTailer if ENV['RAILS_ENV'].eql? 'development'

run ActionController::Dispatcher.new
