class CreateQuickReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :quick_reservations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :department, null: false, foreign_key: true
      t.belongs_to :space, null: false, foreign_key: true

      t.string :email, null: false

      t.string :dep_name, null: false
      t.string :typology, null: false
      t.string :space_name, null: false

      t.timestamps
    end

    add_index :quick_reservations, :email, unique: true, name: 'quick_reservations_index'

  end
end
