module ConversationsHelper

  def user_ids(conversation)
    [].tap do |array|
      array = conversation.recipients
      array.delete(current_user)
      return array
    end
  end

  def pull_right_if_mine(message)
    "pull-right" if message.sender == current_user
  end
end
