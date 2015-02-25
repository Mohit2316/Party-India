class AddRoleToBusinessowners < ActiveRecord::Migration
  def change
    add_column :businessowners, :role, :string
  end
end
