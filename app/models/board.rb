class Board < ActiveRecord::Base
  attr_accessible :token, :name

  has_many :fields

  def prepare_fields 
    40.times do |i|
      i+=1
      field = fields.build index: i
      field.init_field
    end
  end

end
