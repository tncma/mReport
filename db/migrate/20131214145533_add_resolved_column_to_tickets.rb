class AddResolvedColumnToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :resolved, :integer
  end
end
