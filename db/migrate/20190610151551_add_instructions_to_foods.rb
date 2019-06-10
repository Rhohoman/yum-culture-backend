class AddInstructionsToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :instructions, :string
  end
end
