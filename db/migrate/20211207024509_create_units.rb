class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.integer :number
      t.string :floor_plan

      t.timestamps
    end
  end
end
