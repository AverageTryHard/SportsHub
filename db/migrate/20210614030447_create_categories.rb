class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.belongs_to :parent_category, null: true

      t.timestamps
    end

    create_table :teams do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.belongs_to :categories

      t.timestamps
    end
  end
end
