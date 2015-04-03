require "level_processor"

class RewardProcessorException < StandardError; end

class RewardProcessor

  attr_accessor :mission, :user, :options

  def initialize(mission, options = {})
    @mission = mission
    @user = mission.user
    @options = options
  end

  def process!
    update_quest!
    notify!
    update_score!
    reward!
    level_up!

    true
  rescue Exception => e
    puts e
    false
  end

private
  def update_quest!
    @mission.update_attributes(status: "Completed")
  end

  def update_score!
    current_score = @user.score + @mission.rewards.experience.sum(:amount)
    @user.update_attributes(score: current_score)
  end

  def notify!
    RewardMailer.notify(@mission).deliver_now!
  end

  def reward!
    @mission.rewards.each do |reward|
      Bounty.create(
        name:       reward.name,
        amount:     reward.amount,
        category:   reward.category,
        status:     completed_or_pending(reward.category),
        quest_id:   @mission.quest.id,
        user_id:    @user.id
      )
    end
  end

  def level_up!
    LevelProcessor.new(@user).process!
  end

protected
  def completed_or_pending(category)
    if category == "Gold" || category == "Experience"
      "Completed"
    else
      "Pending"
    end
  end

end
