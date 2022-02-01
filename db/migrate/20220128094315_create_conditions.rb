class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.date :dates, null: false
      t.integer :mental, null: false
      t.integer :temperature, null: false
      t.datetime :sleep_start, null: false
      t.datetime :sleep_end, null: false
      t.integer :weight
      t.text :exercise
      t.text :food

      t.timestamps
    end
  end
end
