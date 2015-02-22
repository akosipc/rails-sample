module ActivityManager
  extend ActiveSupport::Concern

  def set_activity(object, recipients, key = nil)
    key = "#{object.class.to_s.downcase}.#{params[:action]}" unless key.present?

    Activity.new(trackable:   object,
                 owner:       current_user,
                 recipients:  recipients,
                 key:         key).save
  end

end

