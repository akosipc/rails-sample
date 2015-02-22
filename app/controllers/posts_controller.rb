class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build

    render partial: "form", layout: false if request.xhr?
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to authenticated_root_path, notice: "Post created"
    else
      render :new
    end
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to authenticated_root_path, notice: "Post updated"
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])

    redirect_to authenticated_root_path if @post.destroy
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
