class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :day
      t.integer :checked
      t.references :habit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
