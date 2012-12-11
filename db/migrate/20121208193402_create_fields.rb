class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :index
      t.integer :board_id
      t.integer :position
      t.string :label
      
      t.timestamps
    end
  end
end
