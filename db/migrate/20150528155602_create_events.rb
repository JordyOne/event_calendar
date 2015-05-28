class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :track
      t.string :name
      t.datetime :start
      t.datetime :finish
    end
    add_index :events, :track
  end
end
