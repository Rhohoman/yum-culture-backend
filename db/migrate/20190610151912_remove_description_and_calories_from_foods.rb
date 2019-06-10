class RemoveDescriptionAndCaloriesFromFoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :description, :string
    remove_column :foods, :calories, :int
  end
end
