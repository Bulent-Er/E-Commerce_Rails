class AddDescriptionToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :description, :string, null: false
  end
end
