class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :id
      t.integer :user_id
      t.integer :conversation_id
      t.text :body

      t.timestamps
    end
    add_index :comments, :conversation_id
    add_index :comments, :user_id
  end
end
