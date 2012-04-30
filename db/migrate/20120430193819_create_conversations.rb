class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :id
      t.string :title, :limit => 50
      t.integer :forum_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
    add_index :conversations, :forum_id
    add_index :conversations, :user_id
  end
end
