# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_magaz_session',
  :secret      => '5cfdbbe10a837bbb393218c26daa1137d011a0b2f7664252cb83e156b30f32941e3e7c09b2037826d6d0993e2eef4fcc1063a3124c12eb343a63aad7c5c37607'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
