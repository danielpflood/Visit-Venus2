class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :id
      t.string :title, :limit => 50
      t.text :description

      t.timestamps
    end
  end
end
