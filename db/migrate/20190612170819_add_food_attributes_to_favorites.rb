class AddFoodAttributesToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :image, :string
    add_column :favorites, :categories, :string
    add_column :favorites, :youtube_url, :string
    add_column :favorites, :area, :string
    add_column :favorites, :instructions, :string
  end
end
