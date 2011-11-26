class Admin::ApplicationController < ApplicationController
  layout "admin_application"
  before_filter :authenticate

  def default_url_options(options={})
    options
  end
  
  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        environment_password = Rails.env.production? ? "5b47517d4a81c670eaaf507269b35ddf00f2b7d6" : "dc697a134ba2347bc88aeb21a0a903e3ed1c5a82"
        user_name == "bossainrio" && Digest::SHA1.hexdigest(password) == environment_password
      end
    end
end
