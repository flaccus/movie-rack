class CreateScreens < ActiveRecord::Migration
  def self.up
    create_table :screens do |t|
      t.references :theater
      t.string :name
      t.integer :seating_capacity
      t.integer :cheap_seats

      t.timestamps
    end
  end

  def self.down
    drop_table :screens
  end
end
