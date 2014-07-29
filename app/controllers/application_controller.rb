class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :ensure_domain
  before_filter :load_sound_cloud

  APP_DOMAIN = 'www.bossainriohostel.com'

  def set_locale
    if params[:i18n_locale].present?
      I18n.locale = params[:i18n_locale] || "pt-BR"
    else
      I18n.locale = :"pt-BR"
    end
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :i18n_locale => I18n.locale }
  end

  private
    def ensure_domain
      if Rails.env.production? && request.env['HTTP_HOST'] != APP_DOMAIN
        # HTTP 301 is a "permanent" redirect
        redirect_to "http://#{APP_DOMAIN}", :status => 301
      end
    end

    def load_sound_cloud
      response = RestClient.get "https://api.soundcloud.com/users/bossainriohostel/favorites.json?client_id=#{ENV['SOUND_CLOUD_CLIENT_ID']}"
      @tracks = JSON.parse(response)
    rescue
      @tracks = []
    end
end
