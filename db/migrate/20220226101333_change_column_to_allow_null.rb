class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :conditions, :mental, :integer, null: true
    change_column :conditions, :temperature, :float, null: true
    change_column :conditions, :sleep_start, :datetime, null: true
    change_column :conditions, :sleep_end, :datetime, null: true
  end

  def down
    change_column :conditions, :mental, :integer, null: false
    change_column :conditions, :temperature, :float, null: false
    change_column :conditions, :sleep_start, :datetime, null: false
    change_column :conditions, :sleep_end, :datetime, null: false
  end
end
