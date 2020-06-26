class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :author_name
      t.integer :likes
      t.string :img
      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :author_name
  end
end
