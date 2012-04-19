class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :eventtype
      t.string :location
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
