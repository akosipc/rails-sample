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
    reward!
    level_up!
  end

private
  def update_quest!
    @mission.update_attributes(status: "Completed")
  end

  def notify!
    RewardMailer.notify(@mission).deliver!
  end

  def reward!
    current_score = @user.score + @mission.rewards.experience.sum(:amount)
    @user.update_attributes(score: current_score)
  end

  def level_up!
    LevelProcessor.new(@user).process!
  end

end
