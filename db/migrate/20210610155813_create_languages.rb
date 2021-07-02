class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :language_name, null: false
      t.string :locale_name, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
