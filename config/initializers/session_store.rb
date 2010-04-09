# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iphone-json_session',
  :secret      => '00f8d02d2f48dc5e7deac506c1bb43b01cc1eaf794e121124dd89ba389bf5ed3c71a3acf79952f35ed1754d76d9f2b009ce8b2fc4134cc0689ee1d494b0a47b7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

if defined? JRuby::Rack
  require 'action_controller/session/java_servlet_store'
  ActionController::Base.session_store = :java_servlet_store
end
