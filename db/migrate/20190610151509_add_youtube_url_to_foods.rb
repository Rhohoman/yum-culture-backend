class AddYoutubeUrlToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :youtube_url, :string
  end
end
