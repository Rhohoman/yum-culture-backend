class AddAreaToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :area, :string
  end
end
