class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    if params[:i18n_locale].present?
      I18n.locale = params[:i18n_locale] || "pt-BR"
      Carmen.default_locale = params[:i18n_locale].split("-").first.to_sym
    else
      I18n.locale = :"pt-BR"
      Carmen.default_locale = :"pt"
    end
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :i18n_locale => I18n.locale }
  end
end
