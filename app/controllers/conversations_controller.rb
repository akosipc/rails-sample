class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.inbox.page(params[:page]).per(75)
  end

  def new
    @message = Messenger.new

    render partial: "form", layout: false if request.xhr?
  end

  def show
    @conversation = Mailboxer::Conversation.find(params[:id])
  end

  def create
    @message = Messenger.new(messenger_params.merge(current_user: current_user))

    if @message.save
      redirect_to conversations_path, notice: "Message has been sent!"
    else
      render :new
    end
  end

  def update
    @conversation = Mailboxer::Conversation.find(params[:id])

    if params[:condition] == "read"
      @conversation.mark_as_read current_user
    elsif params[:condition] == "unread"
      @conversation.mark_as_unread current_user
    end

    redirect_to conversations_path, notice: "Conversation has been updated"
  end

  def destroy
    @conversation = Mailboxer::Conversation.find(params[:id])

    @conversation.mark_as_deleted current_user

    redirect_to conversations_path, notice: "Conversation is now deleted!"
  end

  private
    def messenger_params
      params.require(:messenger).permit(:body, :conversation_id, recipient_ids: [])
    end
end
