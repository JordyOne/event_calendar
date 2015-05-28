class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :track
      t.string :name
      t.datetime :start
      t.datetime :finish
    end
  end
end
