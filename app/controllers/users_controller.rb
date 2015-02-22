class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:profile]

  def edit
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
    render :show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
