before_action :set_locale

def set_locale
  if user_signed_in?
    I18n.locale = current_user.app_language
  elsif params[:locale]
    I18n.locale = params[:locale]
    cookies[:current_locale] = {:value => params[:locale], :expires => 1.year.from_now}
  elsif cookies[:current_locale]
    I18n.locale = cookies[:current_locale].to_sym
  else
    I18n.locale = I18n.default_locale
  end
end
