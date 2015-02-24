class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:profile]

  def edit
    render partial: "form", layout: false if request.xhr?
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to profile_path, notice: "User details successfully updated."
    else
      render :edit
    end
  end

  def show
    redirect_to profile_path if current_user == @user
  end

  def profile
    @user = current_user
    render :show
  end

  def friends
    @friends = @user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :avatar)
    end

end
