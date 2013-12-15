class CreateWards < ActiveRecord::Migration
  def change
    create_table :wards do |t|
      t.string :name
      t.integer :no_of_wards

      t.timestamps
    end
  end
end
