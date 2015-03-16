class RewardMailer < ActionMailer::Base
  
  def notify(mission, options = {})
    @quest    = mission.quest
    @rewards  = mission.rewards
    @user     = mission.user

    mail to:      @user.email,
         from:    Rails.application.secrets.no_reply_email,
         subject: "Your Quest #{@quest.title} has been completed!"
  end

end
