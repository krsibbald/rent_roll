class AddUniquenessIndexToUnitNumber < ActiveRecord::Migration[6.0]
  def change
    add_index :units, :number, unique: true
  end
end
