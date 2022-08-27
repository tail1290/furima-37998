class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    @user = User.new
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :name_kanji_sei, :name_kana_sei, :name_kanji_mei, :name_kana_mei,
                                             :birth_day])
  end
end
