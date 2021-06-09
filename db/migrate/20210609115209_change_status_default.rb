class ChangeStatusDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :status,'active'
  end
end
