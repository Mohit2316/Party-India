class AddApprovedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :approved, :string
  end
end
