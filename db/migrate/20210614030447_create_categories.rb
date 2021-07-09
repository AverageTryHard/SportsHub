class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :primary_categories do |t|
      t.string :name, null: false
      t.belongs_to :parent_category, null: true

      t.timestamps
    end
  end
end
