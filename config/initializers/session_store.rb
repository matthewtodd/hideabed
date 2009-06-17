# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fake_couchdb_session',
  :secret      => '8cc74be3f23f6aa9d5f818dd4e0a0c7136bfd448ad900ada4c20c5a7717b7a5018990e3adfae508d798eb37133b2043bf307706907d21a1c63632b9ea80b6b34'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
