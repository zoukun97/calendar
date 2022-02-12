class CreateLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :levels do |t|
      t.integer :level
      t.integer :thresold
      t.timestamps
    end
  end
end
