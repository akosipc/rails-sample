class LevelProcessorException < StandardError; end

class LevelProcessor

  LEVELING = [
     500     ,
     1500    ,
     3500    ,
     8000    ,
     20000   ,
     36000   ,
     65000   ,
     95000   ,
     120000  ,
     160000  ,
     200000  ,
     280000  ,
     350000  ,
     490000  ,
     610000  ,
     735000  ,
     852000  ,
     980000  ,
     1200000 
  ]

  attr_accessor :user, :options

  def initialize(user, options = {})
    @user = user
    @options = options
  end

  def process!
    if level = check_level!
      @user.update_attributes(level: level + 2)
    end
  end

private

  def check_level!
    return_me = nil

    LEVELING.each_with_index do |value, index|
      return_me = index if @user.score >= value
    end

    return_me
  end

end

