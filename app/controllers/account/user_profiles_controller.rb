class Account::UserProfilesController < ApplicationController
  before_action :authenticate_user!

    def edit
    end

    def update
      if @profile.update(profile_params)
        redirect_to account_users_path
      else
        render "edit"
      end
    end

    private

    def profile_params
      params.require(:profile).permit(:legal_name, :birthday, :location, :occupation, :bio, :wechat_id, :weibo_id, :image)
    end

end
