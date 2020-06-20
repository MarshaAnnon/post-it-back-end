class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :author_name
      t.integer :likes

      t.timestamps
    end
    add_index :posts, :title, unique: true
    add_index :posts, :author_name, unique: true
  end
end
