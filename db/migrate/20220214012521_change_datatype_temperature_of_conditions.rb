class ChangeDatatypeTemperatureOfConditions < ActiveRecord::Migration[6.1]
  def change
    change_column :conditions, :temperature, :float
  end
end