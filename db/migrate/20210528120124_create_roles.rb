class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :permission
      has_many :user_to_roles
      has_many :users, :through => :user_to_roles

      t.timestamps
    end
  end
end
