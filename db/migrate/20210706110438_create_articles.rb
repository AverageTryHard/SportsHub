class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :headline, null: false
      t.string :alt_text, null: true
      t.string :caption, null: false
      t.belongs_to :location

      t.timestamps
    end
  end
end
