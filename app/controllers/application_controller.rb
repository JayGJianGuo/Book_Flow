class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_timezone

  def set_timezone
    if current_user && current_user.time_zone
      Time.zone = current_user.time_zone
    end
  end

  def user_profile
    profile = Profile.find_by(:user_id)
    if @user.profile.blank?
      profile = Profile.create
    end
  end

end
