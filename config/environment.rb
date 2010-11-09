# Be sure to restart your server when you modify this file
# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION
ENV['RAILS_ENV'] = 'development'
# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
Rails::Initializer.run do |config|

  config.gem 'paperclip', :source => 'http://gemcutter.org'
  config.gem 'russian'
  config.gem 'haml'
  config.time_zone = 'UTC'

  config.i18n.default_locale = :ru
  config.action_mailer.delivery_method = :sendmail
end

