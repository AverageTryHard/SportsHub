class ChangeUserToRolesName < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_to_roles, :user_roles
  end
end
