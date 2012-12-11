class Field < ActiveRecord::Base
  
  belongs_to :board
  has_many :players

  attr_accessible :index, :position
  after_initialize :set_field_label

  def init_field
    self.set_board_possition
    self.set_field_label
  end

  protected

    #Sets position of the fileds on the board.
    def set_board_possition
      if index <= 11
        self.position = index
      elsif 11 < index and 30 > index
        @left_side_index = 0
        if index.even? 
          self.position = 41 - ((index - 10)/2)
        else
          self.position = 11 + ((index - 10)/2)
        end
      else
        self.position = 61 - index
      end
    end

    def set_field_label
      if position == 1 
        self.label = 'Start'
      elsif [6,16, 26, 36].include?(position) 
        self.label = 'Rails'
        self.color = '964E64'
      elsif position == 11 
        self.label = 'Jail'
        self.color = 'E37697'
      elsif position == 31
       self.label ='Go to jail'
       self.color = 'E37697'
      end
    end
end
