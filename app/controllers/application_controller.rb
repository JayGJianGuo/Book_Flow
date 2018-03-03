class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_timezone

  def set_timezone
    if current_user && current_user.time_zone
      Time.zone = current_user.time_zone
    end
  end

  before_action :find_user_and_profile

  def find_user_and_profile
    @user = User.find_by(params[:user_id])
    @profile = @user.profile || @user.create_profile
  end

end
