class FriendshipsController < ApplicationController
  include ActivityManager

  before_action :authenticate_user!
  before_action :set_user

  def create
    if current_user.invite @user
      set_activity(current_user, @user, "connection.request")
      FriendshipMailer.requesting(current_user, @user).deliver
      redirect_to user_path(@user), notice: "Successfully invited a user"
    else
      redirect_to user_path(@user), alert: "Error was encountered"
    end
  end

  def update
    if params[:status] == "approve" && current_user.approve(@user)
      FriendshipMailer.confirmed(current_user, @user).deliver
      set_activity(current_user, @user, "connection.approve")
      redirect_to user_path(@user), notice: "Successfully added this user to your network list"
    elsif params[:status] == "block" && current_user.block(@user)
      set_activity(current_user, @user, "connection.block")
      redirect_to user_path(@user), notice: "Successfuly blocked this user"
    elsif params[:status] == "unblock" && current_user.unblock(@user)
      set_activity(current_user, @user, "connection.unblock")
      redirect_to user_path(@user), notice: "Successfuly unblocked this user"
    else
      redirect_to user_path(@user), alert: "Error was encountered"
    end
  end

  def destroy
    if current_user.remove_friendship @user
      set_activity(current_user, @user, "connection.remove")
      redirect_to user_path(@user), notice: "Successfully remove this user from your list"
    else
      redirect_to user_path(@user), alert: "Error was encountered"
    end
  end

private
  def set_user
    @user = User.find(params[:user_id])
  end

end

