class CreateBusinessowners < ActiveRecord::Migration
  def change
    create_table :businessowners do |t|
      t.string :company_name
      t.string :email
      t.string :password
      t.string :company_website
      t.string :phone
      t.references :event, index: true

      t.timestamps null: false
    end
    add_index :businessowners, :email, unique: true
    add_foreign_key :businessowners, :events
  end
end
