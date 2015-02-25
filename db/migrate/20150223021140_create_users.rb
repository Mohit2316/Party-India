class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :picture_url
      t.string :email
      t.string :password
      t.string :phone
      t.date :dob
      t.references :event, index: true

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_foreign_key :users, :events
  end
end
