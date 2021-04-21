ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  fixtures :all

  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  def log_in(username)
    if integration_test?
      login_as(username, scope: :username)
    else
      sign_in(username)
    end
  end
end
