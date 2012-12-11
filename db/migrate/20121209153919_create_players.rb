class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.integer :field_id
      t.integer :board_id
      t.string :color

      t.timestamps
    end

    add_index :players, :field_id
    add_index :players, :board_id
  end
end
