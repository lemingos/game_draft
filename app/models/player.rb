class Player < ActiveRecord::Base
  attr_accessible :field_id, :name, :number, :color

  belongs_to :field
  belongs_to :board 

  def join_game board
    update_attribute :board_id, board.id
    board.fields.where(:position => 1).first.players << self
  end

  def allot
    rand(5) + 1
  end

  def move 
    self.update_attribute :field_id, self.board.fields.where(position: (self.field.position + self.allot).modulo(39)).first.id
  end
end
