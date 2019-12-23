class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  ##============================================================##
  ## Before and After
  ##============================================================##
  before_action :set_locale


  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def check_permission(record)
    redirect_to root_path unless record.user == current_user
  end

  ##============================================================##
  ## After sign in
  ##============================================================##
  def after_sign_up_path_for(resource)
    dashboard_path
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  ##============================================================##
  ## On définie par défault la locale dans toutes les ulrs
  ## générées par l'application.
  ##============================================================##
  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  ##============================================================##
  ## On veut forcer la présence de la langue dans les urls
  ## pour faciliter la lecture dans google Analytics tout en
  ## gardant les paramètres déjà présent dans les urls
  ##============================================================##
  def set_locale
    if params[:locale].present?
      I18n.locale = params[:locale]
    else
      redirect_to url_for(params.merge(:locale => I18n.default_locale).permit!), :status => 301
    end
  end
end
