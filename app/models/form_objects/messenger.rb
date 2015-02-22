class Messenger
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :current_user,      Object
  attribute :recipient_ids,     Array
  attribute :body,              String
  attribute :conversation_id,   String

  validates :body, presence: true

  def persisted?
    false
  end

  def save
    valid? ? persist! : false
  end

  private
    def persist!
      if conversation_id.present?
        current_user.reply_to_conversation(conversation, body)
      else
        current_user.send_message(recipients, body, "Message from #{current_user.full_name}")
      end
    end

    def recipients
      User.where(id: self.recipient_ids)
    end

    def conversation
      Mailboxer::Conversation.find(conversation_id)
    end
end

