class Field < ActiveRecord::Base
  
  belongs_to :board
  has_many :players
  attr_accessible :index, :position
  
  after_initialize :set_board_possition, :set_field_label

  def set_board_possition
    if index <= 11
      self.position = index
    elsif 11 < index and 30 > index
      @left_side_index = 0
      if index.even? 
        self.position = 40 - ((index - 10) /2)
      else
        self.position = 11 + ((index - 10)/2)
      end
    else
      self.position = 60 - index
    end
  end

  def set_field_label
    self.label = case position
    when 1 then 'Start'
    end
  end
end
