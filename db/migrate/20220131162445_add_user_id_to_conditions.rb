class AddUserIdToConditions < ActiveRecord::Migration[6.1]
  def change
    add_reference :conditions, :user
  end
end
