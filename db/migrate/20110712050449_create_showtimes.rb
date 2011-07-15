class CreateShowtimes < ActiveRecord::Migration
  def self.up
    create_table :showtimes do |t|
      t.references :movie
      t.references :screen
      t.time :start_time

      t.timestamps
    end
  end

  def self.down
    drop_table :showtimes
  end
end
