class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :food_id
      t.string :text
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
