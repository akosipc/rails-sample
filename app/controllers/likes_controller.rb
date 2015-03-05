class LikesController < ApplicationController
  include ActivityManager
  before_action :authenticate_user!
  before_action :set_object

  def create
    current_user.toggle_like!(@object)
    redirect_to request.referrer, notice: "Success!"
  end

  private
    def set_object
      @object = params[:object].classify.constantize.find(params[:id])
    end
end
