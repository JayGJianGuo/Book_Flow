class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def show
  end

  def edit
  end

  def update
    if @user != current_user
      redirect_to account_users_path
      flash[:alert] = "这是别人的主页哦😉"
    end

    if @user.update(user_params)
      flash[:notice] = "修改成功"
      redirect_to user_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:time_zone, :profile_attributes => [:id, :legal_name, :birthday, :location, :occupation, :bio, :wechat_id, :weibo_id, :image])
  end

  def find_user
    @user = current_user
    @user.create_profile unless @user.profile
  end

end
