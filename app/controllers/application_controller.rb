class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :require_admin

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    check_i18n = I18n.available_locales.include?(locale)
    I18n.locale = check_i18n ? locale : I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def require_admin
    message = 'Oops, something went wrong!'
    is_admin = user_signed_in? && current_user.admin?
    return redirect_to root_path, alert: message unless is_admin
  end
end
