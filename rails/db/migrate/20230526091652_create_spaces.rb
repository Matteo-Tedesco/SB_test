class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.belongs_to :department, null: false, foreign_key: true

      t.string :dep_name, null: false
      t.string :typology, null: false
      t.string :name, null: false

      t.text :description
      t.integer :floor
      t.integer :number_of_seats
      t.string :state, null: false

      t.timestamps
    end

    add_index :spaces, [:dep_name, :typology, :name], unique: true, name: 'spaces_index'

  end
end
