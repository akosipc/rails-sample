class Activity
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :trackable,         Object
  attribute :owner,             Object
  attribute :key,               String
  attribute :recipients,        Array

  validates :trackable, :owner, :recipients, :key, presence: true

  def persisted?
    false
  end

  def save
    valid? ? persist! : false
  end

  private
    def persist!
      recipients.each do |recipient|
        create_activity(recipient)
      end

    end

    def create_activity(recipient)
      PublicActivity::Activity.create(trackable: self.trackable,
                                      owner:     self.owner,
                                      recipient: recipient,
                                      key:       self.key)
    end
end

