class CreateStays < ActiveRecord::Migration[6.0]
  def change
    create_table :stays do |t|
      t.date :move_in
      t.date :move_out
      t.references :unit, null: false, foreign_key: true
      t.references :resident, null: false, foreign_key: true

      t.timestamps
    end
  end
end
