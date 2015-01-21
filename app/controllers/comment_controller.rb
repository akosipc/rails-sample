class CommentController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def new
    @comment = @post.comments.build
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to authenticated_root_path
    else
      render :new
    end
  end

  def update
    @comment = @post.comments.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to authenticated_root_path
    else
      render :edit
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    redirect_to request.referrer if @comment.destroy
  end

  private
    def set_post
      @post = current_user.posts.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
