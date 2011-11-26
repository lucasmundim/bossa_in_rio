class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:i18n_locale]
    Carmen.default_locale = params[:i18n_locale].split("-").first.to_sym
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :i18n_locale => I18n.locale }
  end
end
