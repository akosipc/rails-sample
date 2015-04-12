class CommentsController < ApplicationController
  include ActivityManager
  before_action :authenticate_user!
  before_action :set_post

  def new
    @comment = @post.comments.build
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      set_activity(@post, current_user.friends, "comment.create")
      redirect_to request.referrer, notice: "Successfully created a comment"
    else
      render :new
    end
  end

  def update
    @comment = @post.comments.find(params[:id])

    if @comment.update_attributes(comment_params.merge(user: current_user))
      set_activity(@post, current_user.friends, "comment.update")
      redirect_to request.referrer, notice: "Successfully updated a comment"
    else
      render :edit
    end
  end

  def destroy
    set_activity(@post, current_user.friends, "comment.update")
    @comment = @post.comments.find(params[:id])

    redirect_to request.referrer, notice: "Successfully deleted a comment"
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
