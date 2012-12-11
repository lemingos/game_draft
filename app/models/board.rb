class Board < ActiveRecord::Base
  attr_accessible :token, :name

  has_many :fields

  def prepare_fields 
    40.times do |i|
      i+=1
      fields.build index: i
    end
  end

end
