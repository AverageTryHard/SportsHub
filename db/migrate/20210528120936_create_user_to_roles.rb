class CreateUserToRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_to_roles do |t|
      t.belongs_to :user
      t.belongs_to :role
    end
  end
end
