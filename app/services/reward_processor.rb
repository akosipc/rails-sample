class RewardProcessorException < StandardError; end

class RewardProcessor

  attr_accessor :mission

  def initialize(mission, options = {})
    @mission = mission
    @user = mission.user
  end

  def process!
    update_quest!
    notify!
    reward!
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

end
