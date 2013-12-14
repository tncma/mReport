class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :description
      t.string :subject
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
