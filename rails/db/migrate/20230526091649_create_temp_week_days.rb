class CreateTempWeekDays < ActiveRecord::Migration[7.0]
  def change
    create_table :temp_week_days do |t|
      t.belongs_to :temp_dep, null: false, foreign_key: true

      t.string :dep_name, null: false
      t.string :day, null: false

      t.string :state, null: false
      t.datetime :apertura, null: false
      t.datetime :chiusura, null: false

      t.timestamps
    end

    add_index :temp_week_days, [:dep_name, :day], unique: true, name: 'temp_week_days_index'

  end
end
