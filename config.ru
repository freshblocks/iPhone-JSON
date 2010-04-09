require 'appengine-rack'
require 'appengine-apis/urlfetch'
require 'cgi'
require 'json'
#require 'rails_dm_datastore'
require 'dm-core'
require 'dm-serializer'

AppEngine::Rack.configure_app(
    :application => 'iphone-json',
    :precompilation_enabled => true,
    :sessions_enabled => true,
    :version => "1")

# original generated code
=begin
AppEngine::Rack.app.resource_files.exclude :rails_excludes
ENV['RAILS_ENV'] = AppEngine::Rack.environment

require ::File.expand_path('../config/environment',  __FILE__)
use Rails::Rack::LogTailer if ENV['RAILS_ENV'].eql? 'development'

run ActionController::Dispatcher.new
=end

# code from jruby-depot.appspot.com
AppEngine::Rack.app.resource_files.exclude :rails_excludes
ENV['RAILS_ENV'] = AppEngine::Rack.environment
 
deferred_dispatcher = AppEngine::Rack::DeferredDispatcher.new(
     :require => File.expand_path('../config/environment', __FILE__),
     :dispatch => 'ActionController::Dispatcher', :isolate => true)
 
map '/admin' do
  use AppEngine::Rack::AdminRequired
  run deferred_dispatcher
end
 
map '/user' do
  use AppEngine::Rack::LoginRequired
  run deferred_dispatcher
end
 
map '/' do
  run deferred_dispatcher
end

