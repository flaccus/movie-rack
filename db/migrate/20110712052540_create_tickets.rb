class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.references :showtime
      t.string :email
      t.integer :seats
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
