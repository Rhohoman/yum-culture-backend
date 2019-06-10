class AddApiIdToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :api_id, :string
  end
end
