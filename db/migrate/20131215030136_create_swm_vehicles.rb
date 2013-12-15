class CreateSwmVehicles < ActiveRecord::Migration
  def change
    create_table :swm_vehicles do |t|
      t.string :name
      t.integer :pushcart_primary
      t.integer :tricycles_primary
      t.integer :auto_primary
      t.integer :minilorry_primary
      t.integer :tractor_primary
      t.integer :lorry_secondary
      t.integer :compactor_secondary
      t.integer :dumper_secondary
      t.decimal :available_acre
      t.decimal :land_for_compost
      t.decimal :balance_req

      t.timestamps
    end
  end
end
