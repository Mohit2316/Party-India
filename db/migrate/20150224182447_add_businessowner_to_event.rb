class AddBusinessownerToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :businessowner, index: true
    add_foreign_key :events, :businessowners
  end
end
